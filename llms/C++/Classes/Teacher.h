#pragma once
#include "User.h"
#include"Course.h"
#include "DB_helper.h"
#include <vector>
#include"Asssignment.h"
#include"Quiz.h"

class Teacher :
    virtual public User
{
protected:
    //acamdeic details
    int instruct_id;
    std::vector<Course> handling_courses;
    Time office_hours;
public:
    Teacher() {}
    Teacher(int uid, const char* _n, const char* _e, const char* _p, int T_ID): User(uid, _n, _e, _p, "teacher"), instruct_id(T_ID) {}
    
    int getInstructorID() {
        return instruct_id;
    }
    std::vector<Course> getCourses_assign() {
        return handling_courses;
    }
    Course getCourse(Course c) {
        for (auto i : handling_courses)
            if (i.getCourseID() == c.getCourseID())
                return i;
    }
    Time getTime() {
        return office_hours;
    }
    /*void addTAtoCourse(int taID, const std::string& courseName) {
        if (dbHelper->assignTAtoCourse(taID, courseName)) {
            std::cout << "TA with ID " << taID << " has been successfully assigned to course " << courseName << "." << std::endl;
        }
        else {
            std::cout << "Failed to assign TA to course." << std::endl;
        }
    }*/

    void gradeAssignment(const char* student_id, const char* assignment_id, const char* grade) {
        
    }

};

