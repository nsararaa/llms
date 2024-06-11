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

class Person {
    const char * name;
public:
    Person(const char * n): name(n){}
    const char * getName(){
        return name;
    }
};

const char * returnName() {
    Person a("Manal Rehman");
    return a.getName();
    
}
const char * returnStudentInfo() {
    Student stu(1, "Manal Rehman", "manal.rehman@gmail.com", "123", "Computer Science","bscs23001", 1, 2, 3.29, 3.29);

    static std::string details;
       std::ostringstream oss;
       oss << stu.getName() << "," << stu.getEmailId() << "," << stu.getRollNo() << ","
           << stu.getGPA()<< "," << stu.getCGPA()<< "," << stu.getMajor();

    details = oss.str();
    const char* c_details = details.c_str();
    return c_details;
}

void handleEmail(const std::string &email) {
    std::cout << "Email received in C++: " << email << std::endl;
}


extern "C" void sendEmailToCPP(const char *email) {
    if (email != nullptr) {
        std::string cppEmail(email);
       // handleEmail(cppEmail);
    }
}



int isUserLoggedIn(){
    return 0;
}


