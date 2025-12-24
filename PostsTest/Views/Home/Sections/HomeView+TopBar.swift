import SwiftUI
import UIKit

extension HomeView {
    var topBar: some View {
        HStack(spacing: 12) {
            Text("Posts")
                .font(AppTheme.rubik(20))
                .foregroundStyle(AppTheme.textPrimary)

            Spacer()

            Button {
                UIImpactFeedbackGenerator(style: .light).impactOccurred()
                isUserPickerPresented = true
            } label: {
                ZStack {
            

                    Image("userIcon")
                        .resizable()
                        .scaledToFit()
                }
                .frame(width: 42, height: 42)
            }
            .buttonStyle(.plain)
        }
        .padding(.horizontal, 16)
        .padding(.top, 16)
        .padding(.bottom, 10)
    }
}
