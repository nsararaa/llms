//
//  HomeView.swift
//  lms
//
//  Created by Sara Noor on 28/05/2024.
//

import SwiftUI




struct CustomButton: View {
    let title: String
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var rollNo: String = ""
    @State private var gpa: String = ""
    @State private var cgpa: String = ""
    @State private var major: String = ""
    @State private var semester: String = ""
    
    var body: some View {
        Button(action: {}) {
            Text(title)
                .font(.system(size: 20))
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .padding()
                .frame(minWidth: 150, minHeight: 110)
        }
        .buttonStyle(.borderedProminent)
        .tint(.black)
    }
}
struct HomeView: View {
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var rollNo: String = ""
    @State private var gpa: String = ""
    @State private var cgpa: String = ""
    @State private var major: String = ""
    @State private var semester: String = ""
    
    var body: some View {
        @State var color: Color = .white
        @State var date = Date.now
        ZStack{
            LinearGradient(gradient: Gradient(colors:[.white]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            VStack(){
                HStack{
                    VStack(alignment: .leading){
                        Text("Home").font(.system(size:32)).fontWeight(.semibold)
                        Text("Welcome \(name)")
                    }
                    Image("pp").resizable().scaledToFit().frame(width: 60, height:60).clipShape(Circle()).padding(.leading, 150)
                }
                .padding(.top, 10)
                .padding(.bottom, 20)
               
                VStack(){
                    Text("Announcements").font(.system(size:20)).fontWeight(.semibold).padding(.leading, -160)
                        
                }
                .padding(.bottom, 130)
                ScrollView(.horizontal){
                    HStack(spacing: 15){
                        
                        CustomButton(title: "GPA: \(gpa)")
                        CustomButton(title: "Semester: \(semester)")
                        CustomButton(title: "Degree: \(major)")
                        
                    }.padding(.leading, 10)
                }
                Spacer()
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

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
