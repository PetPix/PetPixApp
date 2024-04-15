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

// Murtajiz's feature - Settings screen
struct SettingsScreen: View {
    var body: some View {
        
        //        VStack {
        //            Text("Settings Screen")
        //                .font(.title)
        //
        //            Spacer()
        //        }
        
        NavigationView {
            
            Form {
                
                Section(header: Text("Display")) {
                    
                    Toggle(isOn: .constant(false), label: {
                        Text("Dark Mode")
                    })
                    
                    // This will be the first column1
                    
                    Toggle(isOn: .constant(true), label: {
                        Text("Use System Settings")
                    })
                    
                }
                
            }
            
        }
            
            .navigationBarTitle("Settings")
            .tabItem {
                Image(systemName: "gear")
                Text("Settings")
            }
            .tag(3)
            
        }
    } // End Settings screen

//Created by: Ashly Ruiz
struct UserProfileScreen: View {
    @State private var image: UIImage?
    @State private var username: String = ""
    @State private var name = ""
    @State private var bio = ""
    @State private var isImagePickerPresented = false

    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 20) {
                HStack {
                    Spacer()
                    Button(action: {
                        self.isImagePickerPresented = true
                    }) {
                        Text("Edit")
                    }
                    .padding()
                }
                
                Spacer()
                
                HStack {
                    Spacer()
                    if let userImage = image {
                        Image(uiImage: userImage)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 150, height: 150)
                            .clipShape(Circle())
                            .padding()
                    } else {
                        Image(systemName: "person.circle.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 150, height: 150)
                            .clipShape(Circle())
                            .padding()
                            .foregroundColor(.gray)
                    }
                    Spacer()
                }

                VStack(alignment: .center, spacing: 20) {
                    Button(action: {
                        self.isImagePickerPresented = true
                    }) {
                        Text("Upload Image")
                            .frame(maxWidth: .infinity) // Ensure text occupies full width
                    }
                    .padding()
                    .frame(maxWidth: .infinity) // Ensure button occupies full width
                }

                Spacer()
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("Username:")
                    TextField("Username", text: $username)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    Text("Name:")
                    TextField("Name", text: $name)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    Text("Bio:")
                    TextField("Bio", text: $bio)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
            }
            .padding()
        }
        .navigationBarTitle("Profile")
        .sheet(isPresented: $isImagePickerPresented) {
            ImagePicker(image: self.$image)
        }
        .tabItem {
            Image(systemName: "person")
            Text("Profile")
        }
        .tag(2)
    }
}
//Created by: Ashly Ruiz
struct ImagePicker: UIViewControllerRepresentable {
    @Binding var image: UIImage?

    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }

    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}

    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let parent: ImagePicker

        init(parent: ImagePicker) {
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[.originalImage] as? UIImage {
                parent.image = image
            }

            picker.dismiss(animated: true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

