//
//  PostView.swift
//  PetPix
//
//  Created by Summer on 4/6/24.
//

import Foundation
import SwiftUI
import ParseSwift

struct PostView: View {
    @State private var postImage: UIImage?
    @State private var caption: String = ""
    @State private var isPostImagePickerPresented = false
    @State private var postSubmitted = false;
    
    @EnvironmentObject var authenticationManager: AuthenticationManager
    
    var body: some View {

            VStack(alignment: .center, spacing: 20) {
                if let currentImage = postImage {
                    Image(uiImage: currentImage)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 150, height: 150)
                        .padding()
                } else {
                    Image(systemName: "photo.artframe")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 150, height: 150)
                        .padding()
                        .foregroundColor(.gray)
                }
                Button(action: {
                    self.isPostImagePickerPresented = true
                }) {
                    Text("Upload Image")
                        .frame(maxWidth: .infinity)
                }
                TextField("Caption:", text: $caption)
                Button("Share Post") {
                    uploadPost()
                    postSubmitted = true;
                }
                if (postSubmitted) {
                    Text("Post successfully submitted!")
                }
            }
        .textFieldStyle(.roundedBorder)
        .padding()
        .navigationBarTitle("Post")
        .sheet(isPresented: $isPostImagePickerPresented) {
            PostImagePicker(image: self.$postImage)
        }
        .tabItem {
            Image(systemName: "square.and.arrow.up")
            Text("Upload")
        }
        .tag(6)
    }
    
    
    func uploadPost() {
        guard let image = postImage,
        let imageData = image.jpegData(compressionQuality: 0.1) else {
            return
        }
        
        let imageFile = ParseFile(name: "image.jpg", data: imageData)
        var post = Post()
        post.imageFile = imageFile
        post.caption = caption
        post.username =  authenticationManager.curUsername
        post.save { result in
            switch result {
            case .success(let post):
                print("✅ Post Saved! \(post)")
            case .failure(let error):
                print("Error uploading post.\(error)")
            }
        }
    }
}

        
        
struct PostImagePicker: UIViewControllerRepresentable {
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
        let parent: PostImagePicker

        init(parent: PostImagePicker) {
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
