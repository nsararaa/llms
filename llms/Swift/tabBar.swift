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
        @State var isLoggedIn: Bool = false
        TabView{
            
            if isUserLoggedIn() == 0{
                HomeView()
                    .tabItem{
                        (Image(systemName:"house")) }
                CourseView()
                    .tabItem{
                        (Image(systemName:"note.text"))}
                ProfileView()
                    .tabItem{
                        (Image(systemName:"person"))}
                LockView()
                    .tabItem{
                        (Image(systemName:"lock"))}
            }
            else{
                LoginView(isLoggedIn: .constant(false))
            }

            
        }
        .foregroundColor(.black)
        .accentColor(Color(maroon))
        
    }
    
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
