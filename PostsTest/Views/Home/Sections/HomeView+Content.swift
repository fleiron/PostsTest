import SwiftUI

extension HomeView {
    var content: some View {
        ScrollView {
            VStack(spacing: 14) {
                headerCard

                if vm.isLoading && vm.posts.isEmpty {
                    loadingCard
                }

                postsSection
            }
            .padding(.horizontal, 16)
            .padding(.top, 4)
            .padding(.bottom, 24)
        }
        .scrollIndicators(.hidden)
    }

    var loadingCard: some View {
        CardView {
            HStack(spacing: 12) {
                ProgressView().tint(AppTheme.accent)
                Text("Loading posts…")
                    .font(AppTheme.rubik(14))
                    .foregroundStyle(AppTheme.textSecondary)
                Spacer()
            }
        }
    }
}
