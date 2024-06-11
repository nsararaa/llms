#pragma once
#include <vector>
#include <string>
#include "Util.h"
#include "Assignments.h"
#include "Quizes.h"
class Course
{
private:
    const char* course_name;
    int course_ID;
    int credit_Hours;
    Time course_timings;
    //std::vector<std::string> weekdays;
    char grade;

    /*Teacher* instructor;
    std::vector<Student> enrolled_Students;
    std::vector<TA> assigned_TAs;*/
    std::vector<Asssignment> Course_asms;
    std::vector<Quiz> Course_quizes;
public:
    Course(const char* _name, int _ID, int _credithours) :course_name(_name), course_ID(_ID), credit_Hours(_credithours) {}

    const char* getCourseName() {
        return course_name;
    }
    int getCourseID() {
        return course_ID;
    }
    int getCredirHours() {
        return credit_Hours;
    }
    Time getTimings() {
        return course_timings;
    }
    //Teacher* getInstructor() {
    //    return instructor;
    //}
    //std::vector<Student> getStudenst() {
    //    return enrolled_Students;
    //}
    //std::vector<TA> getTA() {
    //    return assigned_TAs;
    //}
    char getGrade() {
        return grade;
    }

    //setters
    void setCoursename(const char* cn) {
        course_name = cn;
    }
    void setCourseID(int cid) {
        course_ID = cid;
    }
    void setCredit_hours(int ch) {
        credit_Hours = ch;
    }
    //void setInstructor(Teacher* Instruct) {
    //    instructor = Instruct;
    //}
    //void setallStudents(std::vector<Student> s) {//to add all students at once
    //    enrolled_Students = s;
    //}
    //void addStudents(Student s) { //add students one by one
    //    enrolled_Students.push_back(s);
    //}
    //void addTA(TA ta) {
    //    assigned_TAs.push_back(ta);
    //}
    void setGrade(char G) {
        grade = G;
    }
};

