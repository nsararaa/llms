//
//  ContentView.swift
//  LMSS
//
//  Created by Sara Noor on 10/06/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var isLoggedIn: Bool = false
    var body: some View {
        VStack {
            if(isLoggedIn){
                TabBar()
            }
            else{
                LoginView(isLoggedIn: $isLoggedIn)
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
