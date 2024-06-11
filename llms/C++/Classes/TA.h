#pragma once
#include "Student.h"
#include "Teacher.h"
#include <vector>
#include "Course.h"
class TA :
     public Student, public Teacher
{
private:
    int TA_id;
    std::vector<Course> assigned_courses;
public:
    TA() {}
    TA(int uid, const char* _name, const char* _email, const char* _password, const char* _rollNo, const char* _m, int sid, int sem, double cgpa, double gpa,
        int tid, int Ta_ID)
        : User(uid, _name, _email, _password, "ta"), Student(uid, _name, _email, _password, _rollNo, _m, sid, sem, cgpa, gpa),
        Teacher(uid, _name, _email, _password, tid), TA_id(Ta_ID) {}

    int getTA_ID() {
        return TA_id;
    }
    std::vector<Course> getAssignCourse() {
        return assigned_courses;
    }
    void AssignCourses(Course c) {
        assigned_courses.push_back(c);
    }
};

