//
//  Course.swift
//  llms
//
//  Created by Sara Noor on 12/06/2024.
//

import Foundation

//
//struct Course: Identifiable {
//    var id = UUID()
//    var noOfCourses: String
//    var name: String
//    var creditHours: String
//    var day1: String
//    var day2: String
//    var s_time1: String
//    var s_time2: String
//    var e_time1: String
//    var e_time2: String
//    var grade: String
//}
//
//func CourseInfo() -> Course {
//    guard let cString = getStudentCourses() else {
//        return Course(noOfCourses: "", name: "", creditHours: "", day1: "", day2: "", s_time1: "", s_time2: "", e_time1: "", e_time2: "", grade: "")
//    }
//    let courseInfo = String(cString: cString).components(separatedBy: ",")
//    if courseInfo.count == 10 {
//        return Course(
//            noOfCourses: courseInfo[0],
//            name: courseInfo[1],
//            creditHours: courseInfo[2],
//            day1: courseInfo[3],
//            day2: courseInfo[4],
//            s_time1: courseInfo[5],
//            s_time2: courseInfo[6],
//            e_time1: courseInfo[7],
//            e_time2: courseInfo[8],
//            grade: courseInfo[9]
//        )
//    }
//    return Course(noOfCourses: "", name: "", creditHours: "", day1: "", day2: "", s_time1: "", s_time2: "", e_time1: "", e_time2: "", grade: "")
//}
