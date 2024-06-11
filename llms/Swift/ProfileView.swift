//
//  ProfileView.swift
//  lms
//
//  Created by Sara Noor on 23/05/2024.
//

import SwiftUI
//import SQLite

struct ProfileView: View {
    var body: some View {
        NavigationView{
            ZStack{
                LinearGradient(gradient: Gradient(colors:[.white]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .ignoresSafeArea()
                
                VStack{
                    HStack{
//                        NavigationLink(destination: LoginView(isLoggedIn: .constant(false))) {
//                            Text("Log Out")
//                                .font(.system(size: 20))
//                                .fontWeight(.semibold)
//                                .foregroundColor(.black)
//                                .cornerRadius(40)
//
//                        }
//                        .padding(.horizontal, -160)
//                        Text(" ")
//                            .toolbar{
//                                ToolbarItem(placement: .navigationBarTrailing){
//                                    Menu{
//                                        Button(action: {}, label: {
//                                            Text("Log Out")
//                                            LoginView(isLoggedIn: .constant(false))
//                                        })
//                                        .onTapGesture {
//                                            LoginView(isLoggedIn: .constant(false))
//                                        }
//                                    }label: {
//                                        Label (
//                                            title: {Text("Add")}, icon:{ Image(systemName: "plus")}
//                                        )
//                                    }
//
//                                }
//                            }
                    }
                    
                    HStack{Image("pp").resizable().scaledToFit().frame(width: 120, height:120).clipShape(Circle())
                        
                    }
                    
                    VStack{
                        Text(String(cString: returnName())).font( .system(size:19)).fontWeight(.semibold)
                            .foregroundColor(.black)
                            .padding(.vertical, 1)
                        
                        
                        Text("bscs23162@itu.edu.pk").font(.system(size:15)).fontWeight(.medium)}
                    .padding(.horizontal)
                    .frame(maxWidth:.infinity, alignment: .center)
                    
                    Divider()
                    Spacer()
                }
                
            }
            
        }
        
                
            
        }
    }


struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

//
//
//class DatabaseManager {
//    var db: Connection?
//
//    init() {
//        do {
//            // Specify the path to the database
//            let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
//            db = try Connection("\(path)/db.sqlite3")
//
//            // Create the users table
//            try createTable()
//        } catch {
//            print("Unable to open database. Verify that you created the directory described in the Getting Started section.")
//        }
//    }
//
//    func createTable() throws {
//        let users = Table("users")
//        let id = Expression<Int64>("id")
//        let name = Expression<String>("name")
//        let email = Expression<String>("email")
//
//        do {
//            try db?.run(users.create { table in
//                table.column(id, primaryKey: true)
//                table.column(name)
//                table.column(email, unique: true)
//            })
//        } catch {
//            print("Table already exists: \(error)")
//        }
//    }
//}
