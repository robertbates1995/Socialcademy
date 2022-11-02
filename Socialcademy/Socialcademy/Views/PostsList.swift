//
//  PostsList.swift
//  Socialcademy
//
//  Created by Robert Bates on 11/2/22.
//

import SwiftUI

struct PostsList: View {
    private var posts = [Post.testPost]
    
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
            List(posts) { post in
                if searchText.isEmpty {
                    PostRow(post: post)
                } else if post.contains(searchText) {
                    HighlightedPostRow(post: post)
                }
            }
            .searchable(text: $searchText)
            .navigationTitle("Posts")
        }
    }
}

struct PostsList_Previews: PreviewProvider {
    static var previews: some View {
        PostsList()
    }
}
