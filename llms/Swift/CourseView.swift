//
//  CourseView.swift
//  lms
//
//  Created by Sara Noor on 29/05/2024.
//

import SwiftUI
struct CustomNavigationButton: View {
    let title: String
    var body: some View {
        NavigationLink(destination: SubjectView(subjectName: title)) {
            Text(title)
                .font(.system(size: 20))
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .frame(width: 170, height: 170)
                .background(Color.black)
                .cornerRadius(40)
                .shadow(radius: 5)
        }
     
    }
}
struct CustomButtonHori2: View {
    let title: [String]
    let maroon = UIColor(red: 0x69 / 255, green: 0x1A / 255, blue: 0x1A / 255, alpha: 1.0)
  
    var body: some View {
        
        ZStack{
            NavigationView(){
                VStack{
                    HStack{
                        CustomNavigationButton(title: title[0])
                            .padding(.horizontal, 10)
                        CustomNavigationButton(title: title[1])
                    }
                    HStack{
                        CustomNavigationButton(title: title[2])
                            .padding(.horizontal, 10)
                        CustomNavigationButton(title: title[3])
                    }
                    HStack{
                        CustomNavigationButton(title: title[4])
                            .padding(.horizontal, 10)
                        CustomNavigationButton(title: title[5])
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
    
    var body: some View {
    
        let titles: [String] = ["OOP", "Probability & Statistic", "DLD", "Database", "Linear Algebra", "Computer Networks"]
        
        ZStack{
            LinearGradient(gradient: Gradient(colors:[.white]), startPoint: .topLeading, endPoint: .bottomTrailing)
                            .ignoresSafeArea()
            VStack(alignment: .leading) {
                Text("My Courses")
                    .font(.system(size: 26))
                    .fontWeight(.bold)
                    .padding(.leading, pad)

                    
                VStack{
                    CustomButtonHori2(title: titles)
                }
                .padding(.bottom, 30)
                
           
            }
            .frame(maxWidth: .infinity, alignment: .leading)
           
               
            
            VStack{
                
            }
            Spacer()
        }
    }
}

struct CourseView_Previews: PreviewProvider {
    static var previews: some View {
        CourseView()
    }
}
