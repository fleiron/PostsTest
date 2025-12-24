import SwiftUI

struct CommentsView: View {
    let post: Post
    @StateObject var vm: CommentsViewModel

    init(post: Post) {
        self.post = post
        _vm = StateObject(wrappedValue: CommentsViewModel(postId: post.id))
    }

    var body: some View {
        ZStack {
            BackgroundView()

            ScrollView {
                VStack(spacing: 14) {
                    postCard

                    if vm.isLoading {
                        loadingCard
                    }

                    if let error = vm.errorText {
                        errorCard(text: error)
                    }

                    commentsSection
                }
                .padding(.horizontal, 16)
                .padding(.top, 10)
                .padding(.bottom, 24)
            }
            .scrollIndicators(.hidden)
        }
        .navigationTitle("Comments")
        .navigationBarTitleDisplayMode(.inline)
        .task { await vm.load() }
        .refreshable { await vm.load() }
        .tint(AppTheme.accent)
    }
}
