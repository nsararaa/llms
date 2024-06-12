#pragma once
#include <string>
#include <fstream>
#include <iostream>
#include "Util.h"
#include <vector>
using namespace std;

class User {
protected:
    int user_id;
    const char* name; // display
    const char* email_id;
    const char* password;
    const char* role;

public:
    User() : user_id(0), name(nullptr), email_id(nullptr), password(nullptr), role(nullptr) {}

    User(int uid, const char* _name, const char* _email_id, const char* _password, const char* _role)
        : user_id(uid), name(nullptr), email_id(nullptr), password(nullptr), role(nullptr) {
        setName(_name);
        setEmailId(_email_id);
        setPassword(_password);
        setRole(_role);
    }

    User(const User& other) : user_id(other.user_id), name(nullptr), email_id(nullptr), password(nullptr), role(nullptr) {
        setName(other.name);
        setEmailId(other.email_id);
        setPassword(other.password);
        setRole(other.role);
    }

    User& operator=(const User& other) {
        if (this != &other) {
            setUserId(other.user_id);
            setName(other.name);
            setEmailId(other.email_id);
            setPassword(other.password);
            setRole(other.role);
        }
        return *this;
    }

    //virtual ~User() {
    //    delete[] name;
    //    delete[] email_id;
    //    delete[] password;
    //    delete[] role;
    //}

    virtual void login() {
        // Implementation for login
    }

    virtual void logout() {
        // Implementation for logout
    }

    virtual void resetPassword() {
        // Assume data has been taken from database
        const char* new_password = "abc";
        setPassword(new_password);
    }

    // Getters
    int getUserId() const {
        return user_id;
    }

    const char* getName() const {
        return name;
    }

    const char* getEmailId() const {
        return email_id;
    }

    const char* getPassword() const {
        return password;
    }

    const char* getRole() const {
        return role;
    }

    // Setters
    void setUserId(int id) {
        user_id = id;
    }

    void setName(const char* _name) {
        name = _name;
    }

    void setEmailId(const char* _email) {
        email_id = _email;
    }

    void setPassword(const char* _password) {
        password = _password;
    }

    void setRole(const char* _role) {
        role = _role;
    }
};
