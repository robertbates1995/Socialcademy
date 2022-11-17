//
//  PostsViewModel.swift
//  Socialcademy
//
//  Created by Robert Bates on 11/9/22.
//

import Foundation

@MainActor
class PostsViewModel: ObservableObject {
    @Published var posts = [Post]()
    
    func makeCreateAction() -> NewPostForm.CreateAction {
        return { [weak self] post in
            try await PostsRepository.create(post)
            self?.posts.insert(post, at: 0)
        }
    }
    
    func fetchPosts() {
        Task {
            do {
                posts = try await PostsRepository.fetchPosts()
            } catch {
                print("[PostsViewModel] cannot find fetch posts: \(error)")
            }
        }
    }
}
