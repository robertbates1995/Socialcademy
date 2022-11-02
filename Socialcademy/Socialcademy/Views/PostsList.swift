//
//  PostsList.swift
//  Socialcademy
//
//  Created by Robert Bates on 11/2/22.
//

import SwiftUI

struct PostsList: View {
    private var posts = [Post.testPost]
    
    var body: some View {
        List(posts) { post in
            Text("Title: \(post.title)")
            Text("Author: \(post.authorName)")
            Text("Content: \(post.content)")
        }
    }
}

struct PostsList_Previews: PreviewProvider {
    static var previews: some View {
        PostsList()
    }
}
