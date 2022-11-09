//
//  PostsViewModel.swift
//  Socialcademy
//
//  Created by Robert Bates on 11/9/22.
//

import Foundation

@MainActor
class PostsViewModel: ObservableObject {
    @Published var posts = [Post.testPost]
}
