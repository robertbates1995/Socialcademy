//
//  Post.swift
//  Socialcademy
//
//  Created by Robert Bates on 11/2/22.
//

import Foundation

struct Post: Identifiable, Equatable, Codable {
    var title: String
    var content: String
    var author: User
    var timestamp = Date()
    var id = UUID()
    var isFavorite = false
    
    func contains(_ string: String) -> Bool {
        let properties = [title,content,author.name].map { $0.lowercased() }
        let query = string.lowercased()
        let matches = properties.filter{ $0.contains(query) }
        return !matches.isEmpty
    }
}

extension Post {
    static let testPost = Post(
        title: "Lorem ipsum",
        content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
        author: User.testUser
    )
}
