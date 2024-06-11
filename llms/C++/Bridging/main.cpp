//
//  main.cpp
//  LMS
//
//  Created by Sara Noor on 07/06/2024.
//

#include "main.h"
#include <iostream>
#include <sstream>
#include "Student.h"
#include "DB_helper.h"


const char * logged_in_email;
Student *logged_in_student;
DB_helper m("oop_project.db");



void initStudent(){
    
    //string name;
    
    
    
    //logged_in_student.setName(name);
    
    
    
}

const char * getStudentInfo() {
    
    
    

    
    Student stu(1, "Manal Rehman", "manal.rehman@gmail.com", "123", "Computer Science","bscs23001", 1, 2, 3.29, 3.29);
    //name email rollno gpa cgpa major sem
    
    static std::string details;
       std::ostringstream oss;
       oss << stu.getName() << "," << stu.getEmailId() << "," << stu.getRollNo() << ","
           << stu.getGPA()<< "," << stu.getCGPA()<< "," << stu.getMajor() << "," << stu.getSemester();

    
    
    details = oss.str();
    const char* c_details = details.c_str();
    return c_details;
        
}


const char * getStudentCourses(){
    static std::string details_courses;
    
    std::ostringstream oss;
    
    //course 
    //name, credit, hour, date1, time1, date2, time2,
    
    //oss;
    
    
    
    
    
    details_courses = oss.str();
    const char* c_details = details_courses.c_str();
    return c_details;
}




extern "C" void sendEmailToCPP(const char *email) {
    if (email != nullptr) {
        std::string cppEmail(email);
        logged_in_email = email;
    }
}



int isUserLoggedIn(){
    return 0;
}


