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
    

    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [.white]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .ignoresSafeArea()
                VStack{
                    
                }
                VStack {
                    VStack {
                        Image("pp")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 120, height: 120)
                            .clipShape(Circle())
                        
                        VStack {
                            Text(name)
                                .font(.system(size: 19))
                                .fontWeight(.semibold)
                                .foregroundColor(.black)
                                .padding(.vertical, 1)
                            
                            Text(email)
                                .font(.system(size: 15))
                                .fontWeight(.medium)
                        }
                        .padding(.vertical)
                        .frame(maxWidth: .infinity, alignment: .center)
                        
                        Divider()
                        Spacer()
                    }
                
                }
                .onAppear {
                    let studentDetails = StudentInfo()
                    self.name = studentDetails.name
                    self.email = studentDetails.email
//                    self.rollNo = studentDetails.rollNo
//                    self.gpa = studentDetails.gpa
//                    self.cgpa = studentDetails.cgpa
//                    self.major = studentDetails.major
                }
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
