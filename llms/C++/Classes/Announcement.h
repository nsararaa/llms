//
//  Announcement.h
//  llms
//
//  Created by Sara Noor on 12/06/2024.
//

#ifndef Announcement_h
#define Announcement_h
#include "Util.h"

class Announcement {
private:
    int ann_id;
    int user_id;
    int course_id;
    std::string title;
    std::string content;
    date date_posted;
    //sqlite3* db;
    //static int next_ann_id;

public:
    // Default constructor
    Announcement()
        : ann_id(0), course_id(0), date_posted({ 0 }) {}

    // Parameterized constructor
    Announcement(int _aid, int uid ,int _cid, const std::string& _t, const std::string& _c, date _date)
        : ann_id(_aid), user_id(uid), course_id(_cid), title(_t), content(_c), date_posted(_date) {}

    // Copy constructor
    Announcement(const Announcement& other)
        : ann_id(other.ann_id), course_id(other.course_id), title(other.title),
        content(other.content), date_posted(other.date_posted) {}

    // Assignment operator
    Announcement& operator=(const Announcement& other) {
        if (this != &other) {
            ann_id = other.ann_id;
            course_id = other.course_id;
            title = other.title;
            content = other.content;
            date_posted = other.date_posted;
        }
        return *this;
    }

    // Getters
    int getAnnId() const {
        return ann_id;
    }

    int getCourseId() const {
        return course_id;
    }

    const std::string& getTitle() const {
        return title;
    }

    const std::string& getContent() const {
        return content;
    }

    date getDatePosted() const {
        return date_posted;
    }

    // Setters
    void setAnnId(int _aid) {
        ann_id = _aid;
    }

    void setCourseId(int _cid) {
        course_id = _cid;
    }

    void setTitle(const std::string& _t) {
        title = _t;
    }

    void setContent(const std::string& _c) {
        content = _c;
    }

    void setDatePosted(date _date) {
        date_posted = _date;
    }

    //bool addAnnouncement(int announcement_ID, const std::string& title, const std::string& content, date date_posted) {
    //    std::string insertSql = "INSERT INTO announcements (title, content, day, month, year) VALUES (?, ?, ?, ?, ?);";
    //    sqlite3_stmt* stmt;

    //    if (sqlite3_prepare_v2(db, insertSql.c_str(), -1, &stmt, nullptr) != SQLITE_OK) {
    //        std::cerr << "Failed to prepare statement: " << sqlite3_errmsg(db) << std::endl;
    //        return false;
    //    }

    //    sqlite3_bind_text(stmt, 1, title.c_str(), -1, SQLITE_STATIC);
    //    sqlite3_bind_text(stmt, 2, content.c_str(), -1, SQLITE_STATIC);
    //    sqlite3_bind_int(stmt, 3, date_posted.day);
    //    sqlite3_bind_int(stmt, 4, date_posted.month);
    //    sqlite3_bind_int(stmt, 5, date_posted.year);

    //    int result = sqlite3_step(stmt);
    //    sqlite3_finalize(stmt);

    //    if (result != SQLITE_DONE) {
    //        std::cerr << "Error inserting data: " << sqlite3_errmsg(db) << std::endl;
    //        return false;
    //    }

    //    std::cout << "Announcement added successfully!" << std::endl;
    //    return true;
    //}
  /*  static void initializeNextAnnouncementId(int initialId) { next_ann_id = initialId; }
    static int getnextannouncementid() {
        next_ann_id++;
        return next_ann_id; }*/
};

//int Announcement::next_ann_id = 13; // Initialize static member variable

#endif /* Announcement_h */
