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
#include "Courses.h"
#include "DB_helper.h"
#include "Announcement.h"

static std::string email_recieved;
static std::string logged_in_email;

static bool isLogged = false;
//static DB_helper m("/Users/saranoor/Downloads/Xcode/llms/oop_project.db");
static Student *stu;
static std::vector <Course*> courses;
static std::vector <Announcement*> announcements;
static int noOfCourses, noOfAnnouncements;
static DB_helper * db;



const char * getStudentInfo() {
   // Student stu(1, "Manal Rehman", "manal.rehman@gmail.com", "123", "Computer Science","bscs23001", 1, 2, 3.29, 3.29);
    //name email rollno gpa cgpa major sem
    
    static std::string details;
    std::ostringstream oss;
           oss << stu->getName() << "," << stu->getEmailId() << "," << stu->getRollNo() << ","
               << stu->getGPA()<< "," << stu->getCGPA()<< "," << stu->getMajor() << "," << stu->getSemester();
    
    
//    std::ostringstream oss;
//           oss << stu.getName() << "," << stu.getEmailId() << "," << stu.getRollNo() << ","
//               << stu.getGPA()<< "," << stu.getCGPA()<< "," << stu.getMajor() << "," << stu.getSemester();
//
//
    details = oss.str();
    const char* c_details = details.c_str();
    return c_details;
        
}

int getNoOfCourses(){
    return noOfCourses;
}
const char * getStudentCourses(){
    static std::string details_courses;
    
    //GetCoursesByStudentId()
     courses = db->GetCoursesByEmail();
    
    std::ostringstream oss;
    noOfCourses = courses.size();
    oss << noOfCourses<< ",";
    //noofCourses, name,instructor, credit, day1, day2, start_time1, start_time2, end_time1, end_time2, grade
    
    for(auto c: courses){
        oss << c->getCourseName()<< ","<< c->getCourseInstructor()<<"," << c->getCredirHours()<< ",";
        for(auto w: c->getWeekdays())
            oss << w<< ",";
        for(auto s: c->getStartTimings())
            oss << s.hours<< ":" << s.min<< ",";
        for(auto e: c->getEndTimings())
            oss << e.hours << ":" << e.min<< ",";
       // oss << c->getGrade();
    }

    oss << "," << ","<<"," << ","<<"," << ","<<"," << ","<< ",";
    details_courses = oss.str();
    const char* c_details = details_courses.c_str();
    return c_details;
}

const char * getCourses(){
    static std::string course_list;
    courses = db->GetCoursesByEmail();
    std::ostringstream oss;
    oss << noOfCourses<< ",";
    
    for(auto c: courses){
        oss << c->getCourseName()<< ",";
    }

    oss << "," << ",";
    course_list = oss.str();
    const char* c_details = course_list.c_str();
    return c_details;
}

const char * getAnnouncements(){
    static std::string details_courses;
    
    //GetCoursesByStudentId()
    announcements = db->getAnnouncement();
    
    std::ostringstream oss;
    noOfAnnouncements = announcements.size();
    oss << noOfAnnouncements<< ",";
    //noofCourses, name,instructor, credit, day1, day2, start_time1, start_time2, end_time1, end_time2, grade
    
    for(auto a: announcements){
        oss << a->getTitle() << ","<< a->getContent() << ",";
    }

    oss << "," << ","<<"," << ","<<"," << ","<<"," << ","<< ",";
    details_courses = oss.str();
    const char* c_details = details_courses.c_str();
    return c_details;
}

int getNoOfAnouncements(){
    return noOfAnnouncements;
}


void setEmail(const char * email){
    static int i =0;
    if (i ==0){
        email_recieved = email;
       db = new DB_helper("/Users/saranoor/Downloads/Xcode/llms/oop_project.db", email_recieved.c_str());
    }
    i++;
}

void setAnnouncement(char * announcement){
    char * ann = announcement;
    
    
}
void setAnnouncementCourse(char * course){
   
    
}


extern "C" void logIn( char *email,  char *password) {
    if (email != nullptr) {
        std::string cppEmail(email);
        //logged_in_email = email;
        
        setEmail(email);
        stu = db->getStudentByEmail();
        
        if(stu != nullptr){
            
            const char * pass = stu->getPassword();
            if(strcmp(pass, password) ==0)
                isLogged =true;
            
        }
    }
}


void setIsLoggedIn(int logged){
    if(logged == 0)
        isLogged = true;
    else
        isLogged = false;
    
}
int isUserLoggedIn(){

    if(isLogged)
        return 0;
    else
        return 1;

    
}

