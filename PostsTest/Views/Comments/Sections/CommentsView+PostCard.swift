import SwiftUI

extension CommentsView {
    var postCard: some View {
        CardView {
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Text("Post")
                        .font(AppTheme.rubik(14))
                        .foregroundStyle(AppTheme.textSecondary)
                    Spacer()
                    Text("#\(post.id)")
                        .font(AppTheme.rubik(12))
                        .foregroundStyle(AppTheme.textSecondary)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 6)
                        .background(Color.white.opacity(0.10), in: Capsule())
                }

                Text(post.title.capitalized)
                    .font(AppTheme.rubik(18))
                    .foregroundStyle(AppTheme.textPrimary)

                Text(post.body)
                    .font(AppTheme.rubik(12))
                    .foregroundStyle(AppTheme.textSecondary)
            }
        }
    }
}
