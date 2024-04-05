//
//  LoginView.swift
//  PetPix
//
//  Created by Ashly Ruiz on 4/4/24.
//
import SwiftUI

struct LoginView: View {
    @State private var username = ""
    @State private var password = ""
    @EnvironmentObject var authenticationManager: AuthenticationManager
    
    var body: some View {
        VStack {
            Text("PetPix")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.bottom, 20)
            TextField("Username", text: $username)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(5.0)
                .padding(.bottom, 20)
            
            SecureField("Password", text: $password)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(5.0)
                .padding(.bottom, 20)
            
            Button(action: {
                // Perform login action here
                authenticationManager.login(username: username, password: password) 
            }) {
                Text("Login")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 220, height: 50)
                    .background(Color.blue)
                    .cornerRadius(15.0)
            }
            Button(action: {
                // Perform create account action here
                authenticationManager.create(username: username, password: password)
            }) {
                Text("Create Account")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 220, height: 50)
                    .background(Color.blue)
                    .cornerRadius(15.0)
            }
        }
        .padding()
    }
}
