import SwiftUI

extension HomeView {
    var headerCard: some View {
        CardView {
            HStack(spacing: 12) {
                ZStack {
                    Circle()
                        .fill(AppTheme.accent.opacity(0.22))
                        .frame(width: 46, height: 46)

                    Image(systemName: "person.fill")
                        .foregroundStyle(AppTheme.accent)
                        .font(.system(size: 18, weight: .bold))
                }

                VStack(alignment: .leading, spacing: 4) {
                    Text("Current user")
                        .font(AppTheme.rubik(12))
                        .foregroundStyle(AppTheme.textSecondary)

                    Text(vm.userName)
                        .font(AppTheme.rubik(18))
                        .foregroundStyle(AppTheme.textPrimary)
                        .lineLimit(1)
                }

                Spacer()

                Text("ID \(vm.userId)")
                    .font(AppTheme.rubik(12))
                    .foregroundStyle(AppTheme.textSecondary)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 6)
                    .background(Color.white.opacity(0.10), in: Capsule())
            }
        }
    }
}
