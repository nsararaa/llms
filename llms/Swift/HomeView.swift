//
//  HomeView.swift
//  lms
//
//  Created by Sara Noor on 28/05/2024.
//

import SwiftUI
struct CustomButton: View {
    let title: String
    let customColor = Color(UIColor.systemGray4)
    
    var body: some View {
        Button(action: {}) {
            Text(title)
                .font(.system(size: 20))
                .fontWeight(.semibold)
                .foregroundColor(.black)
                .padding()
                .frame(minWidth: 150, minHeight: 110)
        }
        .buttonStyle(.borderedProminent)
        .tint(customColor)
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
    
    @State private var announcementInput = ""
    @State private var upcomingDue: Bool = false
    @State private var Deadlines = ""
    
    let maroon = UIColor(red: 0x69 / 255, green: 0x1A / 255, blue: 0x1A / 255, alpha: 1.0)
    var body: some View {
        @State var color: Color = .white
        @State var date = Date.now
        ZStack{
            LinearGradient(gradient: Gradient(colors:[.white]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            VStack(){
                HStack{
                    VStack{
                        VStack(alignment: .leading){
                            Text("Home").font(.system(size:32)).fontWeight(.semibold).foregroundColor(Color(maroon))
                            
                        }
                        .padding(.leading, -20)
                        VStack{
                            Text("Welcome \(name)")
                        }
                        .padding(.leading, 20)
                        
                    }
                    
                    Image("pp").resizable().scaledToFit().frame(width: 60, height:60).clipShape(Circle()).padding(.leading, 150)
                        .padding(.horizontal,10)
                }
                .padding(.top, 10)
                .padding(.bottom, 20)
                //.background(.black)
                
               
                VStack(){
                    Text("Announcements").font(.system(size:20)).fontWeight(.semibold).padding(.leading, -170)
                        .foregroundColor(Color(maroon))
            
                    
                    TextField("Announce something to your class ", text:$announcementInput, axis: .vertical)
                        .lineLimit(4, reservesSpace: true)
                        .font(.subheadline)
                        .padding(12)
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                        .padding(.horizontal, 24)
                    
                                             
                }
                .padding(.bottom, 20)
                ScrollView(.horizontal){
                    HStack(spacing: 15){
                        
                        
                        CustomButton(title: "Semester: \(semester)")
                        CustomButton(title: "GPA: \(gpa)")
                        CustomButton(title: "CGPA: \(cgpa)")
                        CustomButton(title: "Degree: \(major)")
                        
                        
                    }.padding(.leading, 10)
                }
                VStack{
                    Text("Upcoming Deadlines").font(.system(size:20)).fontWeight(.semibold).padding(.leading, -160)
                        .padding(.top, 30)
                        .foregroundColor(Color(maroon))
                    if upcomingDue == false{
                        Text("Wohoo no work due soon").padding(.top, -3)
                            .padding(.leading, -150)
                            .foregroundColor(.gray)
                    }
                    else {
                        Text(Deadlines).padding(.top, -3)
                            .padding(.leading, -150)
                            .foregroundColor(.gray)
                    }
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
