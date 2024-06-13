//
//  HomeView.swift
//  lms
//
//  Created by Sara Noor on 28/05/2024.
//

import SwiftUI



struct CourseList {
    let noOfCourse: String
    let name1: String
    let name2: String
    let name3: String
    let name4: String
    let name5: String
    let name6: String
    
}

func CourseNames() -> CourseList {
    guard let cString = getCourses() else {
        return CourseList(
            noOfCourse: "", //1 9 17,25,,33,40
            name1: "", //8
            name2: "", //2
            name3: "", //3
            name4: "", //4
            name5: "", //5
            name6: "" //6
               )
    }

    let courseInfo = String(cString: cString).components(separatedBy: ",")

    

    return CourseList(
        noOfCourse: courseInfo[0],
        name1: courseInfo[1],
        name2: courseInfo[2],
        name3: courseInfo[3],
        name4: courseInfo[4],
        name5: courseInfo[5],
        name6: courseInfo[6]
    )
}

struct NavToCourseAnn: View {
    let maroon = UIColor(red: 0x69 / 255, green: 0x1A / 255, blue: 0x1A / 255, alpha: 1.0)
    let title: String
    
    
    var body: some View {
       
        NavigationLink(destination: AnnouncementView()) {
            
            Text(title)
                .font(.system(size: 15))
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .frame(width: 100, height: 80)
                .background(Color(maroon))
                .cornerRadius(10)
                .shadow(radius: 5)
        }
        .onAppear{
            let SubNamePtr: UnsafeMutablePointer<CChar> = strdup(title)
            setAnnouncementCourse(SubNamePtr)
        }
        
        
     
    }
}


struct HomeView: View {
    @State private var announcements: [String] = []
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
    
    
    var c1: CourseList  = CourseNames()
    let maroon = UIColor(red: 0x69 / 255, green: 0x1A / 255, blue: 0x1A / 255, alpha: 1.0)
    var body: some View {
        @State var color: Color = .white
        @State var date = Date.now
        ZStack{
            LinearGradient(gradient: Gradient(colors:[.white]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            VStack {
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
                
                ////-----------------------------------------------------------------------------------------------------------------------
                
                Text("Announcements")
                    .font(.system(size: 23))
                    .fontWeight(.semibold)
                    .padding(.leading, -170)
                    .padding(.bottom, 20)
                    .foregroundColor(Color(maroon))
                
                NavigationView {
                           VStack {
                               
                               
                               ScrollView(.horizontal) {
                                   VStack{
                                       HStack(spacing: 15) {
                                           NavToCourseAnn(title: c1.name1)
                                           NavToCourseAnn(title: c1.name2)
                                           NavToCourseAnn(title: c1.name3)
                                           NavToCourseAnn(title: c1.name4)
                                           NavToCourseAnn(title: c1.name5)
                                           if c1.noOfCourse == "6" {
                                               NavToCourseAnn(title: c1.name6)
                                           }
                                       }
                                   }
                               }
                               
                           }
                           .padding(.bottom, 20)
                           .frame(width: 390, height: 200)
                       }
                       .frame(width: 400, height: 200)
                   //    .border(Color.gray)
                   
                
                
                
                ////-----------------------------------------------------------------------------------------------------------------------
                Text("Recent Announcements")
                    .font(.system(size: 14))
                    .fontWeight(.semibold)
                    .padding(.leading, -170)
                    .foregroundColor(Color(maroon))
                
                ScrollView{
                    List(announcements, id: \.self) { announcement in
                        Text(announcement)
                            .font(.system(size: 14))
                    }
                    .listStyle(PlainListStyle())
                    .padding(.leading, 10)
                    .frame(height: 150)
                }
                .padding(.bottom, 20)
                
                if announcements.isEmpty {
                    Text("No recent announcements")
                        .padding(.top, -3)
                        .padding(.leading, -150)
                        .foregroundColor(.gray)
                }
                
                ////-----------------------------------------------------------------------------------------------------------------------
                VStack {
                    Text("Upcoming Deadlines")
                        .font(.system(size: 20))
                        .fontWeight(.semibold)
                        .padding(.leading, -140)
                        .foregroundColor(Color(maroon))

                    if upcomingDue == false {
                        Text("Wohoo no work due soon")
                            .padding(.top, -3)
                            .padding(.leading, -150)
                            .foregroundColor(.gray)
                    } else {
                        Text(Deadlines)
                            .padding(.top, -3)
                            .padding(.leading, -150)
                            .foregroundColor(.gray)
                    }
                    

                    Spacer()
                }

            }
            .padding()
            .onAppear {
                let studentDetails = StudentInfo()
                self.name = studentDetails.name
                self.email = studentDetails.email
                self.rollNo = studentDetails.rollNo
                self.gpa = studentDetails.gpa
                self.cgpa = studentDetails.cgpa
                self.major = studentDetails.major
                self.semester = studentDetails.semester
                
                fetchAnnouncements()
            }
            
           
        }
    }
    
    func formatAnnounc(from announcementString: String) {
            let components = announcementString.components(separatedBy: ",")
        let noOfAnnouncements = getNoOfAnouncements()
        let fetchedAnnouncements = Array(components.dropFirst().prefix(Int(noOfAnnouncements)))
            announcements = fetchedAnnouncements
        }
    func fetchAnnouncements() {
          
          if let cString = getAnnouncements() {
              let announcementString = String(cString: cString)
              formatAnnounc(from: announcementString)
          }
      }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
