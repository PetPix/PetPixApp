//
//  HomeScreen.swift
//  PetPix
//
//  Created by Ashly Ruiz on 4/4/24.
//

import SwiftUI

struct HomeScreen: View {
    var body: some View {
        VStack {
            Text("PetPix")
                .font(.title)
            
            Spacer()
        }
        .navigationBarTitle("Home")
        .tabItem {
            Image(systemName: "house")
            Text("Home")
        }
        .tag(0)
    }
}

struct ExplorePetsScreen: View {
    var body: some View {
        VStack {
            Text("Explore Pets Screen")
                .font(.title)
            
            Spacer()
        }
        .navigationBarTitle("Explore Pets")
        .tabItem {
            Image(systemName: "magnifyingglass")
            Text("Explore")
        }
        .tag(1)
    }
}

struct SettingsScreen: View {
    var body: some View {
        VStack {
            Text("Settings Screen")
                .font(.title)
            
            Spacer()
        }
        .navigationBarTitle("Settings")
        .tabItem {
            Image(systemName: "gear")
            Text("Settings")
        }
        .tag(3)
    }
}

struct UserProfileScreen: View {
    var body: some View {
        VStack {
            Text("User Profile Screen")
                .font(.title)
            
            Spacer()
        }
        .navigationBarTitle("Profile")
        .tabItem {
            Image(systemName: "person")
            Text("Profile")
        }
        .tag(2)
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
