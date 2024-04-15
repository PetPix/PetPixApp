//
//  ViewModel.swift
//  PetPix
//
//  Created by Sean Forjan on 4/13/24.
//

import Foundation
import ParseSwift
import SwiftUI

import ParseSwift

class PostsViewModel: ObservableObject {
    @Published var posts: [Post] = []

    func fetchPosts() {
        Post.query()
            .order([.descending("createdAt")]) // Sorts the posts by creation date in descending order
            .find { result in
                switch result {
                case .success(let posts):
                    DispatchQueue.main.async {
                        self.posts = posts
                    }
                case .failure(let error):
                    print("Error fetching posts: \(error)")
                }
            }
    }
}

