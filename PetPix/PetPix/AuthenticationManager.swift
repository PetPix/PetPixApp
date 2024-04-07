////
////  AuthenticationManager.swift
////  PetPix
////
////  Created by Ashly Ruiz on 4/4/24.
////
//
import Foundation

class AuthenticationManager: ObservableObject {
    @Published var isLoggedIn = false
    @Published var curUsername = ""
    
    // Perform login action
    func login(username: String, password: String) {
        // If login is successful, set isLoggedIn to true
        isLoggedIn = true
        curUsername = username
    }
    
    // Perform create account action
    func create(username: String, password: String) {

        // If account creation is successful, set isLoggedIn to true
        isLoggedIn = true
        curUsername = username
    }
    
    // Perform logout action
    func logout() {
        // Set isLoggedIn to false
        isLoggedIn = false
        curUsername = ""
    }
}
