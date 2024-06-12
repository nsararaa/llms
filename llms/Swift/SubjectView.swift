//
//  SubjectView.swift
//  LMS
//
//  Created by Sara Noor on 29/05/2024.
//

import SwiftUI
//
//struct CourseDetails {
//    let noOfCourses: String
//    let name: String
//    let creditHours: String
//    let day1: String
//    let day2: String
//    let s_time1: String
//    let s_time2: String
//    let e_time1: String
//    let e_time2: String
//    let grade: String
//}
//
//func CourseInfo() -> CourseDetails {
//    guard let cString = getStudentCourses() else {
//        return CourseDetails(noOfCourses: "", name: "", creditHours: "", day1: "", day2: "", s_time1: "", s_time2: "", e_time1: "", e_time2: "", grade: "")
//    }
//
//    let courseInfo = String(cString: cString).components(separatedBy: ",")
//
//    return CourseDetails(
//        noOfCourses: courseInfo[0],
//        name: courseInfo[1],
//        creditHours: courseInfo[2],
//        day1: courseInfo[3],
//        day2: courseInfo[4],
//        s_time1: courseInfo[5],
//        s_time2: courseInfo[6],
//        e_time1: courseInfo[7],
//        e_time2: courseInfo[8],
//        grade: " "
//    )
//}


struct SubjectView: View {
    let sub : CourseDetails
    @State private var noOfCourses: String = ""
    @State private var name: String = ""
    @State private var creditHours: String = ""
    @State private var instructor: String = ""
    @State private var day1: String = ""
    @State private var day2: String = ""
    @State private var s_time1: String = ""
    @State private var s_time2: String = ""
    @State private var e_time1: String = ""
    @State private var e_time2: String = ""
    @State private var grade: String = ""
   // let subjectName: String
    
//    let information = SubjectInformation(
//        instructor: "Sarfraz Raza",
//        daysAndTimes: [self.day1, self.s_time1), self.day1, self.s_time2)],
//        creditHours: self.creditHours,
//        attendance: "90%"
//    )
    
    let assignments = [
        Assignment(id: "1", dueDate: "02-03-2024"),
        Assignment(id: "2", dueDate: "02-03-2024"),
        Assignment(id: "3", dueDate: "02-03-2024")
    ]
    
    let quizzes = [
        Quiz(id: "1", date: "02-03-2024")
       
    ]
    
    var body: some View {
        let maroon = UIColor(red: 0x69 / 255, green: 0x1A / 255, blue: 0x1A / 255, alpha: 1.0)
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.white]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .leading) {
                Text(name)
                    .font(.system(size: 26))
                    .fontWeight(.bold)
                    .padding(.leading, 16)
                    .foregroundColor(Color(maroon))
                
                List {
                    Section(header: Text("Instructor")) {
                        Text(instructor)
                            .font(.body)
                    }
                    
                    Section(header: Text("Credit Hours")) {
                        Text(creditHours)
                            .font(.body)
                    }
                    
//                    Section(header: Text("Attendance")) {
//                        Text(information.attendance)
//                            .font(.body)
//                    }
                    
                    Section(header: Text("Time Table")) {
                       // ForEach(information.daysAndTimes, id: \.0) { day, time in
                        VStack {
                                HStack{
                                    Text("\t\tDay\t\t  ").font(.headline)
                                    Text("Start Time\t\t ").font(.headline)
                                    Text("End Time ").font(.headline)
                                }
                                .padding(.vertical)
                                .frame(maxWidth: .infinity, alignment: .center)
                                .padding(.leading, -40)
                                .padding(.bottom, -10)
                                
                            HStack{
                                Text("\(day1)\t  ").font(.body)
                                Text("\(s_time1)\t\t\t ").font(.body)
                                Text("\(e_time1) ").font(.body)
                            }
                            .padding(.leading, -15)
                            .padding(.bottom,5)
                            HStack{
                                Text("\(day2)\t  ").font(.body)
                                Text("\(s_time2)\t\t\t ").font(.body)
                                Text("\(e_time2) ").font(.body)
                            }
                            .padding(.leading, -15)
                        }
                        
                       // }
                    }
                    
                    Section(header: Text("Due Assignments")) {
                        ForEach(assignments) { assignment in
                            Text("Assignment \(assignment.id) - Due: \(assignment.dueDate)")
                                .font(.body)
                        }
                    }
                    
                    Section(header: Text("Due Quizzes")) {
                        ForEach(quizzes) { quiz in
                            Text("Quiz \(quiz.id) - Date: \(quiz.date)")
                                .font(.body)
                        }
                    }
                }
                .listStyle(PlainListStyle())
            }
            .padding()
        }
        .onAppear {
                    //self.noOfCourses = sub.noOfCourses
                    self.name = sub.name
                    self.instructor = sub.instructor
                    self.creditHours = sub.creditHours
                    self.day1 = sub.day1
                    self.day2 = sub.day2
                    self.s_time1 = sub.s_time1
                    self.s_time2 = sub.s_time2
                    self.e_time1 = sub.e_time1
                    self.e_time2 = sub.e_time2
                }

    }
}

struct SubjectInformation {
    let instructor: String
    let daysAndTimes: [(String, String)]
    let creditHours: String
    let attendance: String
}

struct Assignment: Identifiable {
    let id: String
    let dueDate: String
    //assign Date
}

struct Quiz: Identifiable {
    let id: String
    let date: String
}

struct SubjectView_Previews: PreviewProvider {
    static var previews: some View {
        SubjectView(sub: CourseDetails(
            name: "",
            instructor: "",
            creditHours: "",
            day1: "",
            day2: "",
            s_time1: "",
            s_time2: "",
            e_time1: "",
            e_time2: ""
        ))
    }
}
