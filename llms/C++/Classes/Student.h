#pragma once
#include <iostream>
#include <vector>
#include <map>
#include "User.h"
#include "Util.h"
#include "Courses.h"

class Student :
    virtual public User
{
protected:
    //personal details
    //date dob;
    int student_ID;
    const char* rollNo;
    const char* major;
    int semester;

    //academic details
    float CGPA;//overall
    float GPA;//lastsem passed
    std::vector<Course> courses_enrolled;
    std::vector<Course> courses_passed;
    std::map<std::string, char> grades; //map course ID to grade
    
public:
    Student() {}
    Student(int uid, const char* _name, const char* _email, const char* _password, const char* _rollNo, const char* _m,
        int sid, int sem, double cgpa, double gpa)
        : User(uid, _name, _email, _password, "student"), rollNo(_rollNo), major(_m), student_ID(sid), semester(sem), CGPA(cgpa), GPA(gpa) {}

    int getStudentID() {
        return student_ID;
    }
    const char* getRollNo() {
        return rollNo;
    }
    const char* getMajor() {
        return major;
    }
    int getSemester() {
        return semester;
    }
    float getCGPA() {
        return CGPA;
    }
    float getGPA() {
        return GPA;
    }
    std::vector<Course> getEnrolledCourses() {
        return courses_enrolled;
    }
    Course getCourse(Course c) {
        for (auto i : courses_enrolled){
            if (i.getCourseID() == c.getCourseID())
                return i;
        }
        return c;
    }
    std::vector<Course> getpassedCourses() {
        return courses_passed;
    }
    void enrollCourse(std::string course_id) {
        // Implementation to enroll in a course
       // courses_enrolled.push_back(course_id);
    }

    void viewGrades() const { //remove cout...change to return ig?
        if (grades.empty()) {
            //std::cout << "No grades available." << std::endl;
        }
        else {
            std::cout << "Grades for student " << student_ID << ":" << std::endl;
            for (auto it = grades.begin(); it != grades.end(); ++it) {
                const std::string& course = it->first; // Access the key (course name)
                const char& grade = it->second; // Access the value (grade)
                std::cout << course << ": " << grade << std::endl;
            }
        }
    }

    //std::string getRoleSpecificData() override {
    //    // Implementation for student specific data
    //    std::string data = "Courses Enrolled: ";
    //    for (const auto& course : courses_enrolled) {
    //      //  data += course + " ";
    //    }
    //    return data;
    //}

};

