//
//  PetPixApp.swift
//  PetPix
//
//  Created by Ashly Ruiz on 4/4/24.
//

import SwiftUI
import ParseSwift

@main
struct PetPixApp: App {
    @StateObject var authenticationManager = AuthenticationManager()
    
    var body: some Scene {
        WindowGroup {
            if authenticationManager.isLoggedIn {
                ContentView()
                    .environmentObject(authenticationManager)
            } else {
                LoginView()
                    .environmentObject(authenticationManager)
            }
        }
    }
    
    init() {
        ParseSwift.initialize(applicationId: "P0or6mAKT91uqA4Eq6i4dlcvDWHzNrLE60RdmQY7",
                              clientKey: "vTUVKzxgfgdCw5dqRebIesLTcwtm3xKIwS2Fp0Iq",
                              serverURL: URL(string: "https://parseapi.back4app.com")!)
    }
}
