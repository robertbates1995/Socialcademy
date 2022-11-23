//
//  HighlightedPostRow.swift
//  Socialcademy
//
//  Created by Robert Bates on 11/2/22.
//

import SwiftUI

struct HighlightedPostRow: View {
    typealias DeleteAction = () async throws -> Void
    
    let post: HighlightablePost
    let deleteAction: DeleteAction
    
    private func deletePost() {
        Task {
            try! await deleteAction()
        }
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text(post.authorName)
                    .font(.subheadline)
                    .fontWeight(.medium)
                Spacer()
                Text(post.timestamp.formatted(date: .abbreviated, time: .omitted))
                    .font(.subheadline)
                    .fontWeight(.light)
            }
            .foregroundColor(.gray)
            Text(post.title)
                .font(.title3)
                .fontWeight(.semibold)
            Text(post.content)
            HStack {
                Spacer()
                Button(role: .destructive, action: deletePost) {
                    Label("Delete", systemImage: "trash")
                }
                .labelStyle(.iconOnly)
            }
        }
        .padding(.vertical)
    }
}

struct HighlightedPostRow_Previews: PreviewProvider {
    static var previews: some View {
        List {
            HighlightedPostRow(post: HighlightablePost.testHighlightablePost, deleteAction: {})
        }
    }
}
