//
//  studentInfo.swift
//  llms
//
//  Created by Sara Noor on 11/06/2024.
//

import Foundation
import SwiftUI
import Combine

//class StuInfo: ObservableObject {
//    @Published var name: String = ""
//    @Published var email: String = ""
//    @Published var rollNo: String = ""
//    @Published var gpa: String = ""
//    @Published var cgpa: String = ""
//    @Published var major: String = ""
//
//    func update() {
//        let details = fetchStudentInfo()
//        self.name = details.name
//        self.email = details.email
//        self.rollNo = details.rollNo
//        self.gpa = details.gpa
//        self.cgpa = details.cgpa
//        self.major = details.major
//    }
//}

func fetchStudentInfo() -> (name: String, email: String, rollNo: String, gpa: String, cgpa: String, major: String) {
    guard let cString = getStudentInfo() else {
        return ("", "", "", "", "", "")
    }
    let studentInfo = String(cString: cString).components(separatedBy: ",")
    if studentInfo.count == 6 {
        return (name: studentInfo[0], email: studentInfo[1], rollNo: studentInfo[2], gpa: studentInfo[3], cgpa: studentInfo[4], major: studentInfo[5])
    }
    return ("", "", "", "", "", "")
}
