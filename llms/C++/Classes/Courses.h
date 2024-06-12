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
    std::string Course_instructor;
    std::vector<Time> start_timings;
    std::vector<Time> end_timings;
    std::vector<std::string> weekdays;
    char grade = 'N';

    std::vector<Asssignment> Course_asms;
    std::vector<Quiz> Course_quizes;
public:
    Course() {}
    Course(const char* name, int id, int credits)
        : course_name(name), course_ID(id), credit_Hours(credits) {
    }
    Course(std::vector<Time> st, std::vector<Time> et, std::vector<std::string> wd):
        start_timings(st),
        end_timings(et),
        weekdays(wd) {}
    Course(std::string ci) :Course_instructor(ci) {}
    Course(const char* _name, int _ID, int _credithours, std::vector<Time> st, std::vector<Time> et, std::vector<std::string> wd, std::string ci) :
        course_name(_name),
        course_ID(_ID),
        credit_Hours(_credithours),
        start_timings(st),
        end_timings(et),
        weekdays(wd),
        Course_instructor(ci) {}

    const char* getCourseName() {
        return course_name;
    }
    int getCourseID() {
        return course_ID;
    }
    int getCredirHours() {
        return credit_Hours;
    }
    std::vector<Time> getStartTimings() {
        return start_timings;
    }
    std::vector<Time> getEndTimings() {
        return end_timings;
    }
    std::vector<std::string> getWeekdays() {
        return weekdays;
    }
    char getGrade() {
        return grade;
    }
    std::string getCourseInstructor() { return Course_instructor; }

    // Setters
    void setCourseName(const char* name) {
        course_name = name;
    }

    void setCourseID(int id) {
        course_ID = id;
    }

    void setCreditHours(int credits) {
        credit_Hours = credits;
    }

    void setStartTimings(const std::vector<Time>& timings) {
        start_timings = timings;
    }

    void setEndTimings(const std::vector<Time>& timings) {
        end_timings = timings;
    }

    void setWeekdays(const std::vector<std::string>& days) {
        weekdays = days;
    }
    void setGrade(char G) {
        grade = G;
    }
    void setInstructor(std::string ci) {
        Course_instructor = ci;
    }
};

