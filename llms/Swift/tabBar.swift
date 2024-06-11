//
//  tabBar.swift
//  lms
//
//  Created by Sara Noor on 23/05/2024.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        @State var isLoggedIn: Bool = false
        TabView{
            
            
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
        .foregroundColor(.black)
        .accentColor(.black)
        
    }
    
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
