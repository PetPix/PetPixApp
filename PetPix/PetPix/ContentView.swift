//
//  ContentView.swift
//  PetPix
//
//  Created by Ashly Ruiz on 4/4/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeScreen()
            ExplorePetsScreen()
            UserProfileScreen()
            SettingsScreen()
        }
    }
}

#Preview {
    ContentView()
}
