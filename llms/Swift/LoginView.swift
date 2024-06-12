//
//  LoginView.swift
//  LMS
//
//  Created by Sara Noor on 07/06/2024.
//

import SwiftUI

struct LoginView: View {
    @State private var emailPointer: UnsafeMutablePointer<CChar>? = nil
    @State private var passwordPointer: UnsafeMutablePointer<CChar>? = nil
    @State private var email: String = ""
    @State private var password: String = ""
    
    @Binding var isLoggedIn: Bool
    let maroon = UIColor(red: 0x69 / 255, green: 0x1A / 255, blue: 0x1A / 255, alpha: 1.0)
    var body: some View{
        NavigationStack {
            
            VStack {
                Spacer()
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .padding()
                
               
                .padding(.vertical)
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.leading, -25)
                
                
                VStack{
                    TextField("Enter your email", text:$email)
                        .font(.subheadline)
                        .padding(12)
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                        .padding(.horizontal, 24)
                        .textInputAutocapitalization(.never)
                    SecureField("Enter your password", text: $password)
                        .font(.subheadline)
                        .padding(12)
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                        .padding(.horizontal, 24)
                        .textInputAutocapitalization(.never)
                    
                   
                    
                    NavigationLink {
                        Text("Contact the administration")
                    }label: {
                        Text("Forgot Password")
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .padding(.vertical)
                            .padding(.trailing, 28)
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                    
                   
                    Button{
                        emailPointer = strdup(email)
                        passwordPointer = strdup(password)
                        logIn(emailPointer, passwordPointer)
                        
//                        email.withCString {cString in logIn(cString, password)}
                        let loginStatus = isUserLoggedIn()
                        if loginStatus == 0 {
                            isLoggedIn = true
                        }
                        else{
                            Text("Retry, password or email incorrect!").foregroundColor(.gray)
                                .font(.subheadline)
                        }
                      
                        
                    } label: {
                        Text("Login")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .frame(width: 350, height: 40)
                            .background(Color(maroon))
                            .cornerRadius(8)
                        
                    }
                    
                  
                }
                Spacer()
                
            }
            
        }
        
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(isLoggedIn: .constant(false))
    }
}
