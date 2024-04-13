//
//  SearchView.swift
//  PetPix
//
//  Created by Summer on 4/6/24.
//

import SwiftUI
import ParseSwift
import Alamofire
import AlamofireImage

struct SearchView: View {
    @State private var searchFor = ""
    @State private var posts = [Post]()
    
    var body: some View {
        VStack(alignment: .center) {
            TextField(
                "Search",
                text: $searchFor
            )
            .onSubmit {
                queryPosts(searchText: searchFor)
            }
            .textInputAutocapitalization(.never)
            .textFieldStyle(.roundedBorder)
            .disableAutocorrection(true)
            .border(.secondary)
            .padding()
            ScrollView {
                ForEach(posts) { post in
                    VStack(alignment: .center, spacing: 0) {
                        HStack {
                            if let postUsername = post.username {
                                Text("@" + postUsername)
                                    .font(.headline).italic()
                                    .foregroundColor(.blue)
                                    .padding()
                                Spacer()
                            }
                        }
                        if let postImageUrl = post.imageFile?.url {
                            AsyncImage(url: (postImageUrl)) { image in
                                image.resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                                    .clipped()
                                    .padding()
                            } placeholder: {
                                ProgressView()
                            }
                        }
                        HStack {
                            if let caption = post.caption {
                                Text(caption)
                                    .font(.body)
                                    .padding()
                                Spacer()
                            }
                        }
                    }
                    .background(Color.blue.opacity(0.25))
                    .clipShape(RoundedRectangle(cornerRadius: 25.0, style: .circular))
                    .padding()
                    Spacer()
                }
            }
        }
        .navigationBarTitle("Search")
        .tabItem {
            Image(systemName: "magnifyingglass")
            Text("Explore")
        }
        .tag(1)
    }
    
    func queryPosts(searchText: String) {
        let constraint: QueryConstraint = matchesRegex(key: "caption", regex: searchText, modifiers: "i")
        let query = Post.query(constraint)
            query.find { result in
                switch result {
                case .success(let posts):
                    self.posts = posts
                    print("Posts found")
                case .failure(let error):
                    print("Error \(error)")
                }
                
            }
    }
}
