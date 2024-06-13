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
    static int next_ann_id;

public:
    // Default constructor
    Announcement()
        : ann_id(0), course_id(0), date_posted({ 0 }), user_id(0) {}

    // Parameterized constructor
    Announcement(int _aid, int uid ,int _cid, const std::string& _t, const std::string& _c, date _date)
        : ann_id(_aid), user_id(uid), course_id(_cid), title(_t), content(_c), date_posted(_date) {}

    // Copy constructor
    Announcement(const Announcement& other)
        : ann_id(other.ann_id), user_id(other.user_id), course_id(other.course_id), title(other.title),
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

    static void initializeNextAnnouncementId(int initialId) { next_ann_id = initialId; }
    static int getnextannouncementid() {
        next_ann_id++;
        return next_ann_id; }
};

#endif /* Announcement_h */
