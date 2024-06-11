#pragma once
#include <iostream>
#include <string>
#include "sqlite3.h"
#include "User.h"
#include "Student.h"

class DB_helper {
private:
    sqlite3* db;

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

    ~DB_helper() {
        if (db) {
            sqlite3_close(db);
        }
    }

    void execute(const std::string& sql) {
        char* errorMessage = 0;
        if (sqlite3_exec(db, sql.c_str(), 0, 0, &errorMessage) != SQLITE_OK) {
            std::cout << "SQL error: " << errorMessage << std::endl;
            sqlite3_free(errorMessage);
        }
    }

    User* getUserByEmail(const char* p_email_id) {
        sqlite3_stmt* stmt;
        std::string email = p_email_id;
        std::string selectSql = "SELECT * FROM User WHERE email_id = '" + email + "';";

        if (sqlite3_prepare_v2(db, selectSql.c_str(), -1, &stmt, 0) != SQLITE_OK) {
            std::cout << "Failed to fetch data: " << sqlite3_errmsg(db) << std::endl;
            return nullptr;
        }

        User* user = nullptr;
        if (sqlite3_step(stmt) == SQLITE_ROW) {
            int _id = sqlite3_column_int(stmt, 0);
            const unsigned char* namE = sqlite3_column_text(stmt, 1);
            const unsigned char* passworD = sqlite3_column_text(stmt, 3);
            const unsigned char* rolE = sqlite3_column_text(stmt, 4);

            user = new User(
                _id,
                reinterpret_cast<const char*>(namE),
                p_email_id,
                reinterpret_cast<const char*>(passworD),
                reinterpret_cast<const char*>(rolE)
            );
        }

        //sqlite3_finalize(stmt);
        return user;
    }

    Student* getStudentByEmail(User* user) {
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
};
