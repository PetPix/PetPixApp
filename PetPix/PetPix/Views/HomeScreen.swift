//
//  HomeScreen.swift
//  PetPix
//
//  Created by Ashly Ruiz on 4/4/24.
//
import SwiftUI

struct HomeScreen: View {
    @StateObject private var viewModel = PostsViewModel()

        var body: some View {
            VStack {
                Text("PetPix")
                    .font(.title)
                    .padding(.top)

                ScrollView {
                    VStack(spacing: 30) {
                        ForEach(viewModel.posts, id: \.objectId) { post in
                            if let url = post.imageFile?.url {
                                VStack {
                                    AsyncImage(url: url) { phase in
                                        switch phase {
                                        case .empty:
                                            ProgressView().frame(width: 100, height: 100)
                                        case .success(let image):
                                            image.resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .frame(width: 300, height: 300)
                                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                                .shadow(radius: 7)
                                        case .failure:
                                            Image(systemName: "photo").foregroundColor(.gray)
                                        @unknown default:
                                            EmptyView()
                                        }
                                    }
                                    .frame(maxWidth: .infinity)

                                    if let username = post.username {
                                        Text(username)
                                            .font(.headline)
                                            .frame(maxWidth: 300, alignment: .leading)
                                            .padding(.top, 2)
                                    }

                                    if let caption = post.caption, !caption.isEmpty {
                                        Text(caption)
                                            .font(.caption)
                                            .frame(maxWidth: 300, alignment: .leading)
                                            .multilineTextAlignment(.leading)
                                            .padding(.top, 2)
                                    }
                                }
                            }
                        }
                    }
                    .padding(.horizontal)
                }
                .onAppear {
                    viewModel.fetchPosts()
                }
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
    @State private var isEditing = false
    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 20) {
                HStack {
                    Spacer()
                    Button(action: {
                        self.isEditing.toggle()
                    }) {
                        Text(isEditing ? "Done" : "Edit")
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
                        .disabled(!isEditing)
                    
                    Text("Name:")
                    TextField("Name", text: $name)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .disabled(!isEditing)
                    
                    Text("Bio:")
                    TextField("Bio", text: $bio)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .disabled(!isEditing)
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

