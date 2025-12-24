
import SwiftUI

struct BackgroundView: View {
    var body: some View {
        ZStack {
            AppTheme.bg.ignoresSafeArea()

            
            RadialGradient(
                colors: [
                    AppTheme.accent.opacity(0.22),
                    .clear
                ],
                center: .top,
                startRadius: 10,
                endRadius: 420
            )
            .ignoresSafeArea()

           
            RadialGradient(
                colors: [
                    Color.white.opacity(0.10),
                    .clear
                ],
                center: .bottom,
                startRadius: 10,
                endRadius: 520
            )
            .ignoresSafeArea()
        }
    }
}
