//
//  LockView.swift
//  LMSS
//
//  Created by Sara Noor on 10/06/2024.
//

import SwiftUI

struct LockView: View {
    @EnvironmentObject var authState: AuthState
    @State private var showAlert = false

    var body: some View {
        let maroon = Color(UIColor(red: 0x69 / 255, green: 0x1A / 255, blue: 0x1A / 255, alpha: 1.0))

        ZStack{
            LinearGradient(gradient: Gradient(colors:[maroon, .black]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
                .ignoresSafeArea(.all)
            VStack {
                Button(action: {
                    showAlert = true
                }) {
                    Image(systemName: "lock.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.white)
                }
                .alert(isPresented: $showAlert) {
                    Alert(
                        title: Text("Are you sure you want to log out?"),
                        primaryButton: .destructive(Text("Yes")) {
                            authState.isLoggedIn = false
                        },
                        secondaryButton: .cancel(Text("No"))
                    )
                }
            }
        }
    }
}

struct LockView_Previews: PreviewProvider {
    static var previews: some View {
        LockView()
    }
}
