//
//  PostsList.swift
//  Socialcademy
//
//  Created by Robert Bates on 11/2/22.
//

import SwiftUI

struct PostsList: View {
    @StateObject var viewModel: PostsViewModel
    
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
                            PostRow(viewModel: viewModel.makePostRowViewModel(for: post))
                        } else if post.contains(searchText) {
                            //will need to be changed back to highlightable row
                            PostRow(viewModel: viewModel.makePostRowViewModel(for: post))
                        }
                    }
                    .searchable(text: $searchText)
                    .animation(.default, value: posts)
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
                NewPostForm(viewModel: viewModel.makeNewPostViewModel())
            }
        }
        .onAppear {
            viewModel.fetchPosts()
        }
    }
}

#if DEBUG
struct PostsList_Previews: PreviewProvider {
    static var previews: some View {
        ListPreview(state: .loaded([Post.testPost]))
        ListPreview(state: .empty)
        ListPreview(state: .error)
        ListPreview(state: .loading)
    }
    
    @MainActor
    private struct ListPreview: View {
        let state: Loadable<[Post]>
        
        var body: some View {
            let postsRepository = PostsRepositoryStub(state: state)
            let viewModel = PostsViewModel(postsRepository: postsRepository)
            PostsList(viewModel: viewModel)
        }
    }
}
#endif
