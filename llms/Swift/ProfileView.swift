//
//  ProfileView.swift
//  lms
//
//  Created by Sara Noor on 23/05/2024.
//

import SwiftUI
//import SQLite


func StudentInfo() -> (name: String, email: String, rollNo: String, gpa: String, cgpa: String, major: String, semester : String) {
    guard let cString = getStudentInfo() else {
        return ("", "", "", "", "", "", "")
    }
    //name email rollno gpa cgpa major sem
    let studentInfo = String(cString: cString).components(separatedBy: ",")
    if studentInfo.count == 7 {
        return (name: studentInfo[0], email: studentInfo[1], rollNo: studentInfo[5], gpa: studentInfo[3], cgpa: studentInfo[4], major: studentInfo[2], semester : studentInfo[6])
    }
    return ("", "", "", "", "", "", "")
}


struct ProfileView: View {
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var rollNo: String = ""
    @State private var gpa: String = ""
    @State private var cgpa: String = ""
    @State private var major: String = ""
    @State private var semester: String = ""
    let maroon = UIColor(red: 0x69 / 255, green: 0x1A / 255, blue: 0x1A / 255, alpha: 1.0)
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [.white]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .ignoresSafeArea()
                
                VStack {
                    VStack {
                        Image("pp")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 120, height: 120)
                            .clipShape(Circle())
                            .padding(.top, 30)
                        
                        VStack {
                            Text(name)
                                .font(.system(size: 19))
                                .fontWeight(.semibold)
                                .foregroundColor(Color(maroon))
                                .padding(.vertical, 1)
                                .padding(.bottom, -5)
                            
                            Text(email)
                                .font(.system(size: 15))
                                .fontWeight(.medium)
                                .foregroundColor(.gray)
                        }
                        .padding(.vertical)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(.bottom, 25)
                        Divider()
                        
                        VStack(spacing: 10) {
                            detailRow(label: "Major:", value: major)
                            detailRow(label: "Roll No:", value: rollNo)
                            detailRow(label: "Semester:", value: semester)
                            detailRow(label: "GPA:", value: gpa)
                            detailRow(label: "CGPA:", value: cgpa)
                            
                        }
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Spacer()
                    }
                }
                .onAppear {
                    let studentDetails = StudentInfo()
                    self.name = studentDetails.name
                    self.email = studentDetails.email
                    self.rollNo = studentDetails.rollNo
                    self.gpa = studentDetails.gpa
                    self.cgpa = studentDetails.cgpa
                    self.major = studentDetails.major
                    self.semester = studentDetails.semester
                }
            }
            
        }
    }
    
    
    func detailRow(label: String, value: String) -> some View {
        VStack {
            HStack {
                Text(label)
                    .foregroundColor(Color(maroon))
                    .fontWeight(.bold)
                    .font(.system(size: 19))
                Text(value)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 20)
            Divider()
        }
        
    }

    
}


struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
