#pragma once
#include "Util.h"
class Asssignment
{
    //id
private:
    int asm_id;
    float total_marks;
    float marks_given;
    date assign_date;
    date due_date;
    bool done = false;
    bool late = false;
public:
    int getID() {
        return asm_id;
    }
    float getMarks() {
        return marks_given;
    }
    float get_TotalMarks() {
        return total_marks;
    }
    date getDate() {
        return assign_date;
    }
    date getdDueDate() {
        return due_date;
    }
    bool getIsDone() {
        return done;
    }
    bool getIsLate() {
        return late;
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
        assign_date = d;//set checks?
    }
    void setDueDate(date d) {
        due_date = d;//set checks?
    }
    void setLate(date d) {
        if (d.day > due_date.day)
            late = true;
        else if (d.month > due_date.month)
            late = true;
        else if (d.year > due_date.year)
            late = true;
        late = false;
    }
    void setID(int id) {
        asm_id = id;
    }
};

