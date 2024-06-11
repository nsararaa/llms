//
//  SubjectView.swift
//  LMS
//
//  Created by Sara Noor on 29/05/2024.
//

import SwiftUI
import SQLite3


struct SubjectView: View {
    let subjectName: String
    
    let information = SubjectInformation(
        instructor: "Sarfraz Raza",
        daysAndTimes: [("Monday", "09:30-11:00"), ("Thursday", "08:00-09:30")],
        creditHours: "3",
        attendance: "90%"
    )
    
    let assignments = [
        Assignment(id: "1", dueDate: "02-03-2024"),
        Assignment(id: "2", dueDate: "02-03-2024"),
        Assignment(id: "3", dueDate: "02-03-2024"),
        Assignment(id: "4", dueDate: "02-03-2024")
    ]
    
    let quizzes = [
        Quiz(id: "1", date: "02-03-2024"),
        Quiz(id: "2", date: "02-03-2024"),
        Quiz(id: "3", date: "02-03-2024"),
        Quiz(id: "4", date: "02-03-2024")
    ]
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.white]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .leading) {
                Text(subjectName)
                    .font(.system(size: 26))
                    .fontWeight(.bold)
                    .padding(.leading, 16)
                
                List {
                    Section(header: Text("Instructor")) {
                        Text(information.instructor)
                            .font(.body)
                    }
                    
                    Section(header: Text("Credit Hours")) {
                        Text(information.creditHours)
                            .font(.body)
                    }
                    
                    Section(header: Text("Attendance")) {
                        Text(information.attendance)
                            .font(.body)
                    }
                    
                    Section(header: Text("Time Table")) {
                        ForEach(information.daysAndTimes, id: \.0) { day, time in
                            HStack {
                                Text("Day: \(day)")
                                    .font(.body)
                                Spacer()
                                Text("Time: \(time)")
                                    .font(.body)
                            }
                        }
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
        SubjectView(subjectName: "OOP")
    }
}
