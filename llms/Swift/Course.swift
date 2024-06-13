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
//
//                NavigationView {
//                    VStack {
//                        Text("Announcements")
//                            .font(.system(size: 23))
//                            .fontWeight(.semibold)
//                            .padding(.leading, -170)
//                            .padding(.bottom, 20)
//                            .foregroundColor(Color(maroon))
//
//                        ScrollView(.horizontal) {
//                            HStack(spacing: 15) {
//                                NavToCourseAnn(title: "CS")
//                                NavToCourseAnn(title: "DLD")
//                                NavToCourseAnn(title: "PnS")
//                                NavToCourseAnn(title: "LA")
//                                NavToCourseAnn(title: "OOP")
//                            }
//                        }
//                    }
//                    .padding(.bottom, 20)
//                    .frame(width: 390, height: 250)
//                }
//                .frame(width: 400, height: 250)
//                .border(Color.gray)
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
