import SwiftUI

enum AppTheme {
 
    static let bg = Color(red: 79/255, green: 79/255, blue: 169/255)

 
    static let accent = Color(red: 243/255, green: 197/255, blue: 39/255)

    static let card = Color.white.opacity(0.12)
    static let cardStrong = Color.white.opacity(0.16)
    static let textPrimary = Color.white
    static let textSecondary = Color.white.opacity(0.78)
    static let divider = Color.white.opacity(0.12)

    static func rubik(_ size: CGFloat) -> Font {
        .custom("Rubik-Bold", size: size)
    }
}
