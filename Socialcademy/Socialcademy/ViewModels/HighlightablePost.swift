//
//  HighlightablePost.swift
//  Socialcademy
//
//  Created by Robert Bates on 11/2/22.
//

import Foundation

struct HighlightablePost: Identifiable {
    let post: Post
    let search: String
    
    fileprivate func highlightString(_ source: String) -> AttributedString {
        var temp = AttributedString(source)
        if let range = temp.range(of: search) {
            temp[range].backgroundColor = .accentColor
        }
        return temp
    }
    
    var title: AttributedString { highlightString(post.title) }
    var content: AttributedString { highlightString(post.content) }
    var authorName: AttributedString { highlightString(post.authorName) }
    var timestamp = Date()
    var id = UUID()
}

extension HighlightablePost {
    static let testHighlightablePost = HighlightablePost(
        post: Post.testPost,
        search: "Lorem"
    )
}

