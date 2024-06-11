//
//  HomeView.swift
//  lms
//
//  Created by Sara Noor on 28/05/2024.
//

import SwiftUI


struct CustomButton: View {
    let title: String
  
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
    var body: some View {
        @State var color: Color = .white
        @State var date = Date.now
        ZStack{
            LinearGradient(gradient: Gradient(colors:[.white]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            VStack(){
                VStack(){
//                    ColorPicker("", selection: $color,supportsOpacity: false).frame(maxWidth: .infinity, alignment: .leading)
                    
                }
                HStack{
                    VStack(alignment: .leading){
                        Text("Home").font(.system(size:32)).fontWeight(.semibold)
                        Text("Welcome Sara")
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
                        
                        CustomButton(title: "GPA: ")
                        CustomButton(title: "Semester: ")
                        CustomButton(title: "Degree: ")
                        
                    }.padding(.leading, 10)
                }
                Spacer()
            }
            
           
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
