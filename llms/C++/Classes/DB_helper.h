#pragma once
#include <iostream>
#include <string>
#include "sqlite3.h"
#include "User.h"
#include "Student.h"
#include "Announcement.h"


class DB_helper {
private:
    sqlite3* db;
    std::string p_email_id;

public:
    DB_helper(const std::string& dbName) {
        if (sqlite3_open(dbName.c_str(), &db) != SQLITE_OK) {
            std::cout << "Can't open database: " << sqlite3_errmsg(db) << std::endl;
            db = nullptr;
        }
        else {
            std::cout << "Opened database successfully" << std::endl;
        }
    }
    DB_helper(const std::string& dbName, const char* email_p) {
        p_email_id = static_cast<std::string>(email_p);
        if (sqlite3_open(dbName.c_str(), &db) != SQLITE_OK) {
            std::cout << "Can't open database: " << sqlite3_errmsg(db) << std::endl;
            db = nullptr;
        }
        else {
            std::cout << "Opened database successfully" << std::endl;
        }
    }

    //    ~DB_helper() {
    //        if (db) {
    //            sqlite3_close(db);
    //        }
    //    }

    void execute(const std::string& sql) {
        char* errorMessage = 0;
        if (sqlite3_exec(db, sql.c_str(), 0, 0, &errorMessage) != SQLITE_OK) {
            std::cout << "SQL error: " << errorMessage << std::endl;
            sqlite3_free(errorMessage);
        }
    }

    User* getUserByEmail() {
        sqlite3_stmt* stmt;
        std::string email = p_email_id;
        std::string selectSql = "SELECT * FROM User WHERE email_id = '" + email + "';";

        if (sqlite3_prepare_v2(db, selectSql.c_str(), -1, &stmt, 0) != SQLITE_OK) {
            std::cout << "Failed to prepare statement: " << sqlite3_errmsg(db) << std::endl;
            return nullptr;
        }

        User* user = nullptr;
        int stepResult = sqlite3_step(stmt);

        if (stepResult == SQLITE_ROW) {
            int _id = sqlite3_column_int(stmt, 0);
            const unsigned char* namE = sqlite3_column_text(stmt, 1);
            const unsigned char* passworD = sqlite3_column_text(stmt, 3);
            const unsigned char* rolE = sqlite3_column_text(stmt, 4);

            user = new User(
                _id,
                reinterpret_cast<const char*>(namE),
                (p_email_id.c_str()),
                reinterpret_cast<const char*>(passworD),
                reinterpret_cast<const char*>(rolE)
            );
        }
        else if (stepResult == SQLITE_DONE) {
            std::cout << "No row found for email: " << email << std::endl;
        }
        else {
            std::cout << "Failed to execute step: " << sqlite3_errmsg(db) << std::endl;
        }

        //sqlite3_finalize(stmt);
        return user;
    }

    Student* getStudentByEmail() {
        User* user = getUserByEmail();
        if (!user) {
            return nullptr;
        }
        sqlite3_stmt* stmt;
        std::string student_Id = std::to_string(user->getUserId());
        std::string selectSql = "SELECT * FROM Student WHERE student_id = '" + student_Id + "';";

        if (sqlite3_prepare_v2(db, selectSql.c_str(), -1, &stmt, 0) != SQLITE_OK) {
            std::cout << "Failed to fetch data: " << sqlite3_errmsg(db) << std::endl;
            return nullptr;
        }

        Student* student = nullptr;
        if (sqlite3_step(stmt) == SQLITE_ROW) {
            int studentId = sqlite3_column_int(stmt, 0);
            const unsigned char* rollNo = sqlite3_column_text(stmt, 1);
            const unsigned char* degree = sqlite3_column_text(stmt, 2);
            int semester = sqlite3_column_int(stmt, 3);
            double cgpa = sqlite3_column_double(stmt, 4);
            double gpa = sqlite3_column_double(stmt, 5);

            student = new Student(
                user->getUserId(),
                user->getName(),
                user->getEmailId(),
                user->getPassword(),
                reinterpret_cast<const char*>(rollNo),
                reinterpret_cast<const char*>(degree),
                studentId,
                semester,
                cgpa,
                gpa
            );
        }

        //sqlite3_finalize(stmt);
        return student;
    }
    std::vector<Course*> GetCoursesByEmail() {
        Student* std = getStudentByEmail();
        if (!std) {
            return {};
        }
        std::string std_id = std::to_string(std->getStudentID());

        std::vector<Course*> first_half_courses;
        std::vector<int> Course_ids;
        std::vector<const char*> coursenames;
        std::vector<int> ch;
        std::vector<Course*> latter_half_courses;
        std::vector<Course*> total_course;

        sqlite3_stmt* stmt;
        std::string selectSql = "SELECT * FROM Student_courses WHERE student_id = " + std_id + ";";

        if (sqlite3_prepare_v2(db, selectSql.c_str(), -1, &stmt, 0) != SQLITE_OK) {
            std::cout << "Failed to prepare statement: " << sqlite3_errmsg(db) << std::endl;
            return {};
        }

        while (sqlite3_step(stmt) == SQLITE_ROW) {
            int course_id = sqlite3_column_int(stmt, 1);
            Course_ids.push_back(course_id);
        }

        //sqlite3_finalize(stmt);
        std::vector<std::string> course_instruct;
        for (int course_id : Course_ids) {
            selectSql = "SELECT * FROM Courses WHERE course_id = " + std::to_string(course_id) + ";";

            if (sqlite3_prepare_v2(db, selectSql.c_str(), -1, &stmt, 0) != SQLITE_OK) {
                std::cout << "Failed to prepare statement: " << sqlite3_errmsg(db) << std::endl;
                return {};
            }

            if (sqlite3_step(stmt) == SQLITE_ROW) {
                const unsigned char* coursenamE = sqlite3_column_text(stmt, 1);
                int credithourS = sqlite3_column_int(stmt, 2);
                coursenames.push_back(reinterpret_cast<const char*>(coursenamE));
                ch.push_back(credithourS);

                Course* c = new Course(
                    reinterpret_cast<const char*>(coursenamE),
                    course_id,
                    credithourS
                );
                first_half_courses.push_back(c);
            }
            course_instruct.push_back(GetCourseInstructor(course_id));
            //sqlite3_finalize(stmt);
        }

        latter_half_courses = getTimingsofCoursesBycourse_ID(Course_ids);

        for (int i = 0; i < latter_half_courses.size(); i++) {
            Course* c = new Course(
                first_half_courses[i]->getCourseName(),
                first_half_courses[i]->getCourseID(),
                first_half_courses[i]->getCredirHours(),
                latter_half_courses[i]->getStartTimings(),
                latter_half_courses[i]->getEndTimings(),
                latter_half_courses[i]->getWeekdays(),
                course_instruct[i]
            );
            total_course.push_back(c);
        }

        return total_course;
    }

    Time parseTime(const std::string& timeStr) {
        Time time;
        char delimiter;
        std::istringstream timeStream(timeStr);
        timeStream >> time.hours >> delimiter >> time.min;

        if (timeStream.fail() || delimiter != ':') {
            throw std::invalid_argument("Invalid time format");
        }

        return time;
    }

    std::vector<Course*> getTimingsofCoursesBycourse_ID(const std::vector<int>& Course_ids) {
        sqlite3_stmt* stmt;
        std::vector<Course*> courses;

        for (int course_id : Course_ids) {
            std::vector<Time> s_times;
            std::vector<Time> e_times;
            std::vector<std::string> wds;

            std::string selectSql = "SELECT * FROM Course_timing WHERE course_id = " + std::to_string(course_id) + ";";
            if (sqlite3_prepare_v2(db, selectSql.c_str(), -1, &stmt, 0) != SQLITE_OK) {
                std::cout << "Failed to prepare statement: " << sqlite3_errmsg(db) << std::endl;
                return {};
            }

            while (sqlite3_step(stmt) == SQLITE_ROW) {
                std::string starttimE = reinterpret_cast<const char*>(sqlite3_column_text(stmt, 2));
                std::string endtimE = reinterpret_cast<const char*>(sqlite3_column_text(stmt, 3));
                std::string weekdayS = reinterpret_cast<const char*>(sqlite3_column_text(stmt, 4));

                Time start_time = parseTime(starttimE);
                Time end_time = parseTime(endtimE);

                s_times.push_back(start_time);
                e_times.push_back(end_time);
                wds.push_back((weekdayS));
            }

            //sqlite3_finalize(stmt);

            Course* c = new Course(s_times, e_times, wds);
            courses.push_back(c);
        }

        return courses;
    }
    std::string GetCourseInstructor(const int Course_ids) {
        sqlite3_stmt* stmt;
        int instruct_ids;
        std::string instruct_names;
        std::string selectSql = "SELECT * FROM course_instructor WHERE course_id = " + std::to_string(Course_ids) + ";";

        if (sqlite3_prepare_v2(db, selectSql.c_str(), -1, &stmt, 0) != SQLITE_OK) {
            std::cout << "Failed to prepare statement: " << sqlite3_errmsg(db) << std::endl;
            return {};
        }

        if (sqlite3_step(stmt) == SQLITE_ROW) {
            instruct_ids = sqlite3_column_int(stmt, 1);
        }
        selectSql = "SELECT * FROM User WHERE user_id = " + std::to_string(instruct_ids) + ";";
        if (sqlite3_prepare_v2(db, selectSql.c_str(), -1, &stmt, 0) != SQLITE_OK) {
            std::cout << "Failed to prepare statement: " << sqlite3_errmsg(db) << std::endl;
            return {};
        }
        if (sqlite3_step(stmt) == SQLITE_ROW) {
            instruct_names = reinterpret_cast<const char*>(sqlite3_column_text(stmt, 1));
        }
        return instruct_names;
    }
    date parseDate(const std::string& dateStr) {
        date parsedDate;
        char delimiter;
        std::istringstream dateStream(dateStr);

        dateStream >> parsedDate.day >> delimiter >> parsedDate.month >> delimiter >> parsedDate.year;

        if (dateStream.fail() || delimiter != '/') {
            throw std::invalid_argument("Invalid date format");
        }

        return parsedDate;
    }

    std::vector<Announcement*> getAnnouncement() {
        std::vector<Announcement*> announcements;

        sqlite3_stmt* stmt;
        std::string selectSql = "SELECT * FROM announcements;";

        if (sqlite3_prepare_v2(db, selectSql.c_str(), -1, &stmt, 0) != SQLITE_OK) {
            std::cout << "Failed to prepare statement: " << sqlite3_errmsg(db) << std::endl;
            return announcements;
        }

        while (sqlite3_step(stmt) == SQLITE_ROW) {

            int announce_id = sqlite3_column_int(stmt, 0);
            int user_iD = sqlite3_column_int(stmt, 1);
            int c_id = sqlite3_column_int(stmt, 2);
            std::string titlE = reinterpret_cast<const char*>(sqlite3_column_text(stmt, 3));
            std::string contenT = reinterpret_cast<const char*>(sqlite3_column_text(stmt, 4));
            std::string date_posteD = reinterpret_cast<const char*>(sqlite3_column_text(stmt, 5));

            date dp = parseDate(date_posteD);
            Announcement* announcement = new Announcement(
                announce_id,
                user_iD,
                c_id,
                titlE,
                contenT,
                dp
            );
            announcements.push_back(announcement);

        }
        // sqlite3_finalize(stmt); // Finalize the prepared statement
        return announcements;
    }

    std::string dateToString(const date& dateObj) {
        std::ostringstream dateStream;
        dateStream << dateObj.day << '/' << dateObj.month << '/' << dateObj.year;
        return dateStream.str();
    }
    bool addAnnouncement(const std::string& title, const std::string& content, date date_posted) {
        std::string insertSql = "INSERT INTO announcements (title, content, date_posted) VALUES (?, ?, ?, ?, ?);";
        sqlite3_stmt* stmt;

        if (sqlite3_prepare_v2(db, insertSql.c_str(), -1, &stmt, nullptr) != SQLITE_OK) {
            std::cerr << "Failed to prepare statement: " << sqlite3_errmsg(db) << std::endl;
            return false;
        }

        std::string str_date = dateToString(date_posted);
        sqlite3_bind_text(stmt, 3, title.c_str(), -1, SQLITE_STATIC);
        sqlite3_bind_text(stmt, 4, content.c_str(), -1, SQLITE_STATIC);
        sqlite3_bind_text(stmt, 5, str_date.c_str(), -1, SQLITE_STATIC);

        int result = sqlite3_step(stmt);
        sqlite3_finalize(stmt);

        if (result != SQLITE_DONE) {
            std::cerr << "Error inserting data: " << sqlite3_errmsg(db) << std::endl;
            return false;
        }

        std::cout << "Announcement added successfully!" << std::endl;
        return true;
    }
};
