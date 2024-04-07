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
            .disableAutocorrection(true)
            .border(.secondary)
            
            List(posts) { post in
//                if let user = post.user {
//                    if let username = user.username {
//                        Text(username)
//                            .font(.caption)
//                    }
//                }
                if let postUsername = post.username {
                    Text(postUsername)
                        .font(.caption)
                }
                if let postImageUrl = post.imageFile?.url {
                    AsyncImage(url: (postImageUrl)) { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 200, height: 200, alignment: .center)
                    } placeholder: {
                        ProgressView()
                    }
                }
                if let caption = post.caption {
                    Text(caption)
                        .font(.caption)
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
