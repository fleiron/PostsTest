import SwiftUI

extension CommentsView {
    var loadingCard: some View {
        CardView {
            HStack(spacing: 12) {
                ProgressView()
                    .tint(AppTheme.accent)
                Text("Loading comments…")
                    .font(AppTheme.rubik(14))
                    .foregroundStyle(AppTheme.textSecondary)
                Spacer()
            }
        }
    }
}
