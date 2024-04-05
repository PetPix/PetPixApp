//
//  PetPixApp.swift
//  PetPix
//
//  Created by Ashly Ruiz on 4/4/24.
//

import SwiftUI

@main
struct PetPixApp: App {
    @StateObject var authenticationManager = AuthenticationManager()
    
    var body: some Scene {
        WindowGroup {
            if authenticationManager.isLoggedIn {
                ContentView()
            } else {
                LoginView()
                    .environmentObject(authenticationManager)
            }
        }
    }
}

