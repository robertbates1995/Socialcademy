//
//  NewPostForm.swift
//  Socialcademy
//
//  Created by Robert Bates on 11/7/22.
//

import SwiftUI

struct NewPostForm: View {
    @State private var post = Post(
        title: "",
        content: "",
        authorName: ""
    )
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Title", text: $post.title)
                    TextField("Author Name", text: $post.authorName)
                }
                Section("Content") {
                    TextEditor(text: $post.content)
                        .multilineTextAlignment(.leading)
                }
            }
            .navigationTitle("New Post")
        }
    }
}

struct NewPostForm_Previews: PreviewProvider {
    static var previews: some View {
        NewPostForm()
    }
}
