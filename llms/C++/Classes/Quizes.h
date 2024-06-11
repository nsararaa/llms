#pragma once
#include "Util.h"
class Quiz
{
private:
    int quiz_id;
    float total_marks;
    float marks_given;
    date date_taken;
public:
    int getID() {
        return quiz_id;
    }
    float getMarks() {
        return marks_given;
    }
    float get_TotalMarks() {
        return total_marks;
    }
    date getDate() {
        return date_taken;
    }
    bool markQuiz(float m) {
        if (m <= total_marks)
        {
            marks_given = m;  return true;
        }
        return false;
    }
    void setTotalMarks(float m) {
        total_marks = m;
    }
    void setDate(date d) {
        date_taken = d;//set checks?
    }
    void setID(int id) {
        quiz_id = id;
    }
};

