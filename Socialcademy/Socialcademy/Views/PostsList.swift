//
//  PostsList.swift
//  Socialcademy
//
//  Created by Robert Bates on 11/2/22.
//

import SwiftUI

struct PostsList: View {
    @StateObject var viewModel = PostsViewModel()
    @State private var searchText = ""
    @State private var showNewPostForm = false
    
    var body: some View {
        NavigationView {
            Group {
                switch viewModel.posts {
                case .loading:
                    ProgressView()
                case let .error(error):
                    EmptyListView(title: "Cannot Load Posts", message: error.localizedDescription, retryAction: {
                        viewModel.fetchPosts()
                    })
                case .empty:
                    EmptyListView(title: "No Posts", message: "There aren't any posts yet.")
                case let .loaded(posts):
                    List(posts) { post in
                        if searchText.isEmpty {
                            PostRow(post: post)
                        } else if post.contains(searchText) {
                            HighlightedPostRow(post: HighlightablePost(post: post, search: searchText))
                        }
                    }
                    .searchable(text: $searchText)
                }
            }
            .navigationTitle("Posts")
            .toolbar {
                Button {
                    showNewPostForm = true
                } label: {
                    Label("New Post", systemImage: "square.and.pencil")
                }
            }
            .sheet(isPresented: $showNewPostForm) {
                NewPostForm(createAction: viewModel.makeCreateAction())
            }
        }
        .onAppear {
            viewModel.fetchPosts()
        }
    }
}


struct PostsList_Previews: PreviewProvider {
    static var previews: some View {
        PostsList()
    }
}
