import SwiftUI

extension HomeView {
    var postsSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text("Posts")
                    .font(AppTheme.rubik(18))
                    .foregroundStyle(AppTheme.textPrimary)

                Spacer()

                if vm.isLoading && !vm.posts.isEmpty {
                    ProgressView().tint(AppTheme.accent)
                }
            }
            .padding(.horizontal, 4)

            VStack(spacing: 12) {
                ForEach(vm.posts) { post in
                    NavigationLink {
                        CommentsView(post: post)
                    } label: {
                        PostCard(post: post)
                    }
                    .buttonStyle(.plain)
                }
            }
        }
    }
}

