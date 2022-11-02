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
        NavigationView {
            List(posts) { post in
                PostRow(post: post)
            }
            .navigationTitle("Posts")
        }
    }
}

struct PostsList_Previews: PreviewProvider {
    static var previews: some View {
        PostsList()
    }
}
