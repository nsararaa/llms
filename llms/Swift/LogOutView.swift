////
////  LogOutView.swift
////  llms
////
////  Created by Sara Noor on 12/06/2024.
////
//
//import SwiftUI
//
//struct LogOutView: View {
//    @State var isLoggedIn: Bool = false
//    var body: some View {
//    VStack{
//        if(isLoggedIn){
//            TabBar()
//        }
//        else{
//            LoginView(isLoggedIn: .constant(false))
//        }
//    }.padding()
//            .onAppear {
//                        updateLoginStatus()
//            }
//        }
//        func updateLoginStatus() {
//            let status = isUserLoggedIn()
//            isLoggedIn = (status == 0)
//        }
//}
//
//struct LogOutView_Previews: PreviewProvider {
//    static var previews: some View {
//        LogOutView()
//    }
//}
