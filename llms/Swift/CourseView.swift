//
//  CourseView.swift
//  lms
//
//  Created by Sara Noor on 29/05/2024.
//

import SwiftUI

struct CourseDetails {
    let name: String
    let instructor: String
    let creditHours: String
    let day1: String
    let day2: String
    let s_time1: String
    let s_time2: String
    let e_time1: String
    let e_time2: String
}

func CourseInfo(index: Int) -> CourseDetails {
    guard let cString = getStudentCourses() else {
        return CourseDetails(
                   name: "", //1 9 17,25,,33,40
                   instructor: "", //8
                   creditHours: "", //2
                   day1: "", //3
                   day2: "", //4
                   s_time1: "", //5
                   s_time2: "", //6
                   e_time1: "", //7
                   e_time2: "" //8
               )
    }

    let courseInfo = String(cString: cString).components(separatedBy: ",")

    //let s: String = courseInfo[0]
    let courseStartIndex = (index - 1) * 9
    

    return CourseDetails(
        name: courseInfo[courseStartIndex + 1],
        instructor: courseInfo[courseStartIndex+2],
        creditHours: courseInfo[courseStartIndex + 3],
        day1: courseInfo[courseStartIndex + 4],
        day2: courseInfo[courseStartIndex + 5],
        s_time1: courseInfo[courseStartIndex + 6],
        s_time2: courseInfo[courseStartIndex + 7],
        e_time1: courseInfo[courseStartIndex + 8],
        e_time2: courseInfo[courseStartIndex + 9]
    )
}
struct CustomNavigationButton: View {
    let maroon = UIColor(red: 0x69 / 255, green: 0x1A / 255, blue: 0x1A / 255, alpha: 1.0)
    let title: String
    let i: Int
 

    
    var body: some View {
        let course = CourseInfo(index: i)
        
        
        NavigationLink(destination: SubjectView(sub: course)) {
            Text(title)
                .font(.system(size: 20))
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .frame(width: 170, height: 170)
                .background(Color(maroon))
                .cornerRadius(40)
                .shadow(radius: 5)
        }
        
        
     
    }
}
struct CustomButtonHori2: View {
    var c1: CourseDetails  = CourseInfo(index: 1)
    var c2: CourseDetails  = CourseInfo(index: 2)
    var c3: CourseDetails  = CourseInfo(index: 3)
    var c4: CourseDetails  = CourseInfo(index: 4)
    var c5: CourseDetails  = CourseInfo(index: 5)
    
    var c6: CourseDetails  = CourseInfo(index: 6)
    
    
    
    //let courseDetails = CourseInfo()
    
    var body: some View {
        
        ZStack{
            NavigationView(){
                VStack{
                    HStack{
                        CustomNavigationButton(title: c1.name, i: 1)
                            .padding(.leading, -9)
                            .padding(.horizontal, 10)
                        CustomNavigationButton(title:c2.name, i: 2)
                    }
                    HStack{
                        CustomNavigationButton(title:c3.name, i: 3)
                            .padding(.leading, -9)
                            .padding(.horizontal, 10)
                        CustomNavigationButton(title:c4.name, i: 4)
                    }
                    HStack{
                        
                        if getNoOfCourses() > 5{
                            CustomNavigationButton(title:c5.name, i: 5)
                                .padding(.leading, -9)
                                .padding(.horizontal, 10)
                            CustomNavigationButton(title:c6.name, i: 6)
                        }
                        else{
                            CustomNavigationButton(title:c5.name, i: 5)
                                .padding(.leading, -180)
                                .padding(.horizontal, 10)
                        }
                    }
                }
                
            }
            .tint(.black)
            
            
        }
    }
}



struct CourseView: View {
    var pad : CGFloat = 16
    var NOC: Int = 5
    var title1 = "OOP"

    
    let maroon = UIColor(red: 0x69 / 255, green: 0x1A / 255, blue: 0x1A / 255, alpha: 1.0)
    var body: some View {
    
       // let titles: [String] = ["OOP", "Probability & Statistic", "DLD", "Database", "Linear Algebra", "Computer Networks"]
        
        ZStack{
            LinearGradient(gradient: Gradient(colors:[.white]), startPoint: .topLeading, endPoint: .bottomTrailing)
                            .ignoresSafeArea()
            VStack(alignment: .leading) {
                Text("My Courses")
                    .font(.system(size: 26))
                    .fontWeight(.bold)
                    .padding(.leading, pad)
                    .padding(.top, 20)
                    .foregroundColor(Color(maroon))
                

                    
                VStack{
                    CustomButtonHori2()
                }
                .padding(.bottom, 30)
                
           
            }
            .frame(maxWidth: .infinity, alignment: .leading)
           
          
        }
        .onAppear{
            
        }
    }
}

struct CourseView_Previews: PreviewProvider {
    static var previews: some View {
        CourseView()
    }
}


