//
//  main.h
//  LMS
//
//  Created by Sara Noor on 07/06/2024.
//
#ifdef __cplusplus
extern "C"
{
#endif

const char * returnName();
void logIn( char *email,  char *password);
int isUserLoggedIn();
const char * getStudentInfo();
const char * getStudentCourses();
void setIsLoggedIn(int logged);
int getNoOfCourses();
#ifdef __cplusplus
}
#endif
