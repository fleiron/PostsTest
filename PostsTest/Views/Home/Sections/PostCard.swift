import SwiftUI


struct PostCard: View {
    let post: Post

    var body: some View {
        CardView {
            VStack(alignment: .leading, spacing: 10) {
                Text(post.title.capitalized)
                    .font(AppTheme.rubik(16))
                    .foregroundStyle(AppTheme.textPrimary)
                    .lineLimit(2)

                Text(post.body)
                    .font(AppTheme.rubik(12))
                    .foregroundStyle(AppTheme.textSecondary)
                    .lineLimit(3)

                HStack {
                    Text("Post #\(post.id)")
                        .font(AppTheme.rubik(11))
                        .foregroundStyle(AppTheme.textSecondary)

                    Spacer()

                    Image(systemName: "chevron.right")
                        .font(.system(size: 12, weight: .bold))
                        .foregroundStyle(AppTheme.accent.opacity(0.95))
                }
                .padding(.top, 2)
            }
        }
    }
}
