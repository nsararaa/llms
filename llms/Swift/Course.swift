////
////  HomeView.swift
////  lms
////
////  Created by Sara Noor on 28/05/2024.
////
//
//import SwiftUI
//
////struct NavToCourseAnn: View {
////    let maroon = UIColor(red: 0x69 / 255, green: 0x1A / 255, blue: 0x1A / 255, alpha: 1.0)
////    let title: String
////
////
////    var body: some View {
////
////        NavigationLink(destination: AnnouncementView()) {
////
////            Text(title)
////                .font(.system(size: 15))
////                .fontWeight(.semibold)
////                .foregroundColor(.white)
////                .frame(width: 100, height: 80)
////                .background(Color(maroon))
////                .cornerRadius(10)
////                .shadow(radius: 5)
////        }
////
////
////
////
////    }
////}
//
//struct ContentView: View {
//    @State private var announcements: [String] = ["quiz next class", "class cancel"]
//    @State private var announcementInput = ""
//    @State private var upcomingDue: Bool = false
//    @State private var Deadlines = ""
//    
//    let maroon = UIColor(red: 0x69 / 255, green: 0x1A / 255, blue: 0x1A / 255, alpha: 1.0)
//    
//    var body: some View {
//        ZStack {
//            LinearGradient(gradient: Gradient(colors:[.white]), startPoint: .topLeading, endPoint: .bottomTrailing)
//                .ignoresSafeArea()
//            VStack {
//                HStack {
//                    VStack {
//                        VStack(alignment: .leading) {
//                            Text("Home")
//                                .font(.system(size: 32))
//                                .fontWeight(.semibold)
//                                .foregroundColor(Color(maroon))
//                        }
//                        .padding(.leading, -20)
//                        
//                        VStack {
//                            Text("Welcome Sara")
//                        }
//                        .padding(.leading, 20)
//                    }
//                }
//                .padding(.top, 10)
//                .padding(.bottom, 20)
//                Text("Announcements")
//                    .font(.system(size: 23))
//                    .fontWeight(.semibold)
//                    .padding(.leading, -170)
//                    .padding(.bottom, -12)
//                    .foregroundColor(Color(maroon))
//                
//                NavigationView {
//                    VStack {
//                      
//                        
//                        ScrollView(.horizontal) {
//                            VStack{
//                                HStack(spacing: 15) {
//                                    NavToCourseAnn(title: "CS")
//                                    NavToCourseAnn(title: "DLD")
//                                    NavToCourseAnn(title: "PnS")
//                                    NavToCourseAnn(title: "LA")
//                                    NavToCourseAnn(title: "OOP")
//                                }
//                                
//                            }
//                          
//                        }
//                       
//                    }
//                    .padding(.bottom, 20)
//                    .frame(width: 390, height: 200)
//                }
//                .frame(width: 400, height: 200)
//               // .border(Color.gray)
//                
//                
//                
//                Text("Recent Announcements")
//                    .font(.system(size: 14))
//                    .fontWeight(.semibold)
//                    .padding(.leading, -170)
//                    .foregroundColor(Color(maroon))
//                    
//                ScrollView{
//                    List(announcements, id: \.self) { announcement in
//                        Text(announcement)
//                            .font(.system(size: 14))
//                    }
//                    .listStyle(PlainListStyle())
//                    .padding(.leading, 10)
//                    .frame(height: 100)
//                }
//                
//                VStack {
//                    Text("Upcoming Deadlines")
//                        .font(.system(size: 20))
//                        .fontWeight(.semibold)
//                        .padding(.leading, -160)
//                        .foregroundColor(Color(maroon))
//                    
//                    if upcomingDue == false {
//                        Text("Wohoo no work due soon")
//                            .padding(.top, -3)
//                            .padding(.leading, -150)
//                            .foregroundColor(.gray)
//                    } else {
//                        Text(Deadlines)
//                            .padding(.top, -3)
//                            .padding(.leading, -150)
//                            .foregroundColor(.gray)
//                    }
//                        
//                    Spacer()
//                }
//                
//            }
//            .padding()
//            
//        }
//        
//    }
//    
//}
//
////
////func detailRow(label: String, value: String) -> some View {
////    VStack {
////        HStack {
////            Text(label)
////                .foregroundColor(.black)
////                .fontWeight(.bold)
////                .font(.system(size: 19))
////            Text(value)
////        }
////        .frame(maxWidth: .infinity, alignment: .leading)
////        .padding(.leading, 20)
////        Divider()
////    }
////
////}
////
////struct HomeView_Previews: PreviewProvider {
////    static var previews: some View {
////        ContentView()
////    }
////}
