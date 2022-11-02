//
//  PostRow.swift
//  Socialcademy
//
//  Created by Robert Bates on 11/2/22.
//

import SwiftUI

struct PostRow: View {
    let post: Post
    
    var body: some View {
        VStack {
            Text("Title: \(post.title)")
            Text("Author: \(post.authorName)")
            Text("Timestamp: \(post.timestamp.formatted())")
            Text("Content: \(post.content)")
        }
    }
}

struct PostRow_Previews: PreviewProvider {
    static var previews: some View {
        List{
            PostRow(post: Post.testPost)
        }
    }
}
