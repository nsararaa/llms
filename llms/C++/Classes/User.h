#pragma once
#include <string>
#include <fstream>
#include <iostream>
#include "Util.h"
#include <vector>
using namespace std;

class User
{
protected:
    int user_id;
    const char* name;//display
    const char* email_id;
    const char* password;
    const char* role;
public:
    User() {}
    User(int uid, const char* _name, const char* _email_id, const char* _password, const char* _role) :user_id(uid), name(_name), email_id(_email_id), password(_password), role(_role) {}

    virtual void login() {

    }

    virtual void logout() {
    }

    virtual void resetPassword() {
        //assume data has been taken from databse
        const char* new_password = "abc";
        //send to login to ask for new password and have it return to nwpassword variable
        password = new_password;
        //update the password in database
    }

    //make getter //user can only retrieve not set
    int getUserId() {
        return user_id;
    }
    const char* getName() {
        return name;
    }
    const char* getEmailId() {
        return email_id;
    }
    const char* getPassword() {
        return password;
    }
    const char* getRole() {
        return role;
    }
//    virtual ~User() {
//        delete[] name;
//        delete[] email_id;
//        delete[] password;
//        delete[] role;
//    }
};

