//
//  tabBar.swift
//  lms
//
//  Created by Sara Noor on 23/05/2024.
//

import SwiftUI

struct TabBar: View {
    
      let maroon = UIColor(red: 0x69 / 255, green: 0x1A / 255, blue: 0x1A / 255, alpha: 1.0)
      var body: some View {
          ZStack{
              LinearGradient(gradient: Gradient(colors: [.black]), startPoint: .topLeading, endPoint: .bottomTrailing)
                             .ignoresSafeArea(.all)
              TabView {
                  HomeView()
                      .tabItem {
                          Image(systemName: "house")
                      }
                  CourseView()
                      .tabItem {
                          Image(systemName: "note.text")
                      }
                  ProfileView()
                      .tabItem {
                          Image(systemName: "person")
                      }
                  LockView()
                      .tabItem {
                          Image(systemName: "lock")
                      }
              }
              .foregroundColor(.black)
              .accentColor(Color(maroon))
          }
      }
    
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
