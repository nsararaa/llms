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
void sendEmailToCPP(const char *email);
int isUserLoggedIn();
const char * getStudentInfo();
#ifdef __cplusplus
}
#endif
