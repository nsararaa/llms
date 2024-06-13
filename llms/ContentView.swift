//
//  ContentView.swift
//  LMSS
//
//  Created by Sara Noor on 10/06/2024.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var authState: AuthState
    @State private var isLoggedIn: Bool = false
    var body: some View {
        VStack {
            if authState.isLoggedIn {
                TabBar()
            }
            else {
                LoginView( isLoggedIn: .constant(true))
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
