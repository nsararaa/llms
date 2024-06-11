//
//  LockView.swift
//  LMSS
//
//  Created by Sara Noor on 10/06/2024.
//

import SwiftUI

struct LockView: View {
    @State private var isLoggedIn: Bool = false
    
    var body: some View {
        if(isLoggedIn){
            TabBar()
        }
        else{
            LoginView(isLoggedIn: $isLoggedIn)
        }
    }
}

struct LockView_Previews: PreviewProvider {
    static var previews: some View {
        LockView()
    }
}
