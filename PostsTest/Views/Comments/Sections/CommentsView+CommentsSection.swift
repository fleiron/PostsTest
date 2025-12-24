import SwiftUI

extension CommentsView {
    var commentsSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Comments")
                .font(AppTheme.rubik(18))
                .foregroundStyle(AppTheme.textPrimary)
                .padding(.horizontal, 4)

            VStack(spacing: 12) {
                ForEach(vm.comments) { c in
                    CommentCard(comment: c)
                }
            }
        }
    }
}

private struct CommentCard: View {
    let comment: Comment

    var body: some View {
        CardView {
            VStack(alignment: .leading, spacing: 10) {
                HStack(alignment: .top, spacing: 10) {
                    ZStack {
                        Circle()
                            .fill(AppTheme.accent.opacity(0.18))
                            .frame(width: 34, height: 34)

                        Text(String(comment.name.prefix(1)).uppercased())
                            .font(AppTheme.rubik(14))
                            .foregroundStyle(AppTheme.accent)
                    }

                    VStack(alignment: .leading, spacing: 4) {
                        Text(comment.name)
                            .font(AppTheme.rubik(14))
                            .foregroundStyle(AppTheme.textPrimary)
                            .lineLimit(2)

                        Text(comment.email)
                            .font(AppTheme.rubik(11))
                            .foregroundStyle(AppTheme.textSecondary)
                            .lineLimit(1)
                    }

                    Spacer()
                }

                Text(comment.body)
                    .font(AppTheme.rubik(12))
                    .foregroundStyle(AppTheme.textSecondary)
            }
        }
    }
}
