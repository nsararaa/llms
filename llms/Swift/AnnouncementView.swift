//
//  AnnouncementView.swift
//  calender
//
//  Created by Sara Noor on 13/06/2024.
//

import SwiftUI

struct AnnouncementView: View {
    @State private var announcementInput = ""
    @State private var subject = ""
    @State private var subjectInput: String = ""
    @State private var showAlert: Bool = false
    
    let maroon = UIColor(red: 0x69 / 255, green: 0x1A / 255, blue: 0x1A / 255, alpha: 1.0)
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors:[.white]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            VStack{
//                Text("Announcement").font(.system(size:20)).fontWeight(.semibold).padding(.leading, -170)
//                    .foregroundColor(Color(maroon))
                
                TextField("Announce something to your class ", text:$announcementInput, axis: .vertical)
                                     .lineLimit(4, reservesSpace: true)
                                     .font(.subheadline)
                                     .padding(12)
                                     .background(Color(.systemGray6))
                                     .cornerRadius(10)
                                     .padding(.horizontal, 24)
                                     .padding(.top, -15)
                                 Button(action: {
                                                 if announcementInput.isEmpty {
                                                     showAlert = true
                                                 } else {
                                                     
                                                     //SUBMISSION (sent to c)
                                                     sendAnnouncementToC()
                                                     

                                                 }
                                             }) {
                                                 Text("Submit")
                                                     .foregroundColor(.white)
                                                     .padding()
                                                     .font(.system(size: 10))
                                                     .background( announcementInput.isEmpty ? Color(maroon) : Color.blue)
                                                     .cornerRadius(14)
                                             }
                                             .padding(.top, 5)
                                             .padding(.leading, 260)
                                             //.padding(.top, -180)
                                             .alert(isPresented: $showAlert) {
                                                 Alert(
                                                     title: Text("Missing Information"),
                                                     message: Text("Please enter an announcement."),
                                                     dismissButton: .default(Text("OK"))
                                                 )
                                             }
                                
            }
            
        }
    }
    func sendAnnouncementToC() {
           announcementInput.withCString { cString in
               setAnnouncementCourse(UnsafeMutablePointer(mutating: cString))
           }
        subject.withCString { cString in
            setAnnouncement(UnsafeMutablePointer(mutating: cString))
        }
    }
}

struct AnnouncementView_Previews: PreviewProvider {
    static var previews: some View {
        AnnouncementView()
    }
}
