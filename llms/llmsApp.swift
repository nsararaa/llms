//
//  llmsApp.swift
//  llms
//
//  Created by Sara Noor on 11/06/2024.
//

import SwiftUI
import Combine

class AuthState: ObservableObject {
    @Published var isLoggedIn: Bool = false
}
@main
struct llmsApp: App {
    @StateObject private var authState = AuthState()
    var body: some Scene {
        WindowGroup {
            
            ContentView()
                .environmentObject(authState)
        }
    }
}
