import SwiftUI

extension CommentsView {
    func errorCard(text: String) -> some View {
        CardView {
            VStack(alignment: .leading, spacing: 8) {
                Text("Something went wrong")
                    .font(AppTheme.rubik(16))
                    .foregroundStyle(AppTheme.textPrimary)

                Text(text)
                    .font(AppTheme.rubik(12))
                    .foregroundStyle(Color.red.opacity(0.9))
            }
        }
    }
}
