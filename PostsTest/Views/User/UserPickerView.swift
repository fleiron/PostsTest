import SwiftUI
import UIKit

struct UserPickerView: View {
    @Environment(\.dismiss) private var dismiss
    @StateObject private var vm = UsersViewModel()

    let selectedUserId: Int
    let onSelect: (User) -> Void

    var body: some View {
        NavigationStack {
            ZStack(alignment: .top) {
                BackgroundView()

                ScrollView {
                    VStack(spacing: 12) {
                     
                        Color.clear.frame(height: 64)

                        if vm.isLoading {
                            CardView {
                                HStack(spacing: 12) {
                                    ProgressView().tint(AppTheme.accent)
                                    Text("Loading users…")
                                        .font(AppTheme.rubik(14))
                                        .foregroundStyle(AppTheme.textSecondary)
                                    Spacer()
                                }
                            }
                        } else if let error = vm.errorText {
                            CardView {
                                VStack(alignment: .leading, spacing: 10) {
                                    Text("Error")
                                        .font(AppTheme.rubik(16))
                                        .foregroundStyle(AppTheme.textPrimary)
                                    Text(error)
                                        .font(AppTheme.rubik(12))
                                        .foregroundStyle(Color.red.opacity(0.9))

                                    Button {
                                        UIImpactFeedbackGenerator(style: .light).impactOccurred()
                                        Task { await vm.load() }
                                    } label: {
                                        Text("Retry")
                                            .font(AppTheme.rubik(14))
                                            .foregroundStyle(AppTheme.bg)
                                            .padding(.vertical, 10)
                                            .frame(maxWidth: .infinity)
                                            .background(AppTheme.accent, in: RoundedRectangle(cornerRadius: 14, style: .continuous))
                                    }
                                }
                            }
                        } else {
                            VStack(spacing: 12) {
                                ForEach(vm.users) { user in
                                    Button {
                                        UIImpactFeedbackGenerator(style: .light).impactOccurred()
                                        onSelect(user)
                                        dismiss()
                                    } label: {
                                        CardView {
                                            HStack(spacing: 12) {
                                                ZStack {
                                                    Circle()
                                                        .fill(AppTheme.accent.opacity(0.18))
                                                        .frame(width: 40, height: 40)
                                                    Text(String(user.name.prefix(1)).uppercased())
                                                        .font(AppTheme.rubik(16))
                                                        .foregroundStyle(AppTheme.accent)
                                                }

                                                VStack(alignment: .leading, spacing: 4) {
                                                    Text(user.name)
                                                        .font(AppTheme.rubik(14))
                                                        .foregroundStyle(AppTheme.textPrimary)
                                                        .lineLimit(1)
                                                    Text("@\(user.username) • \(user.email)")
                                                        .font(AppTheme.rubik(11))
                                                        .foregroundStyle(AppTheme.textSecondary)
                                                        .lineLimit(1)
                                                }

                                                Spacer()

                                                if user.id == selectedUserId {
                                                    Image(systemName: "checkmark.circle.fill")
                                                        .font(.system(size: 18, weight: .bold))
                                                        .foregroundStyle(AppTheme.accent)
                                                }
                                            }
                                        }
                                    }
                                    .buttonStyle(.plain)
                                }
                            }
                        }
                    }
                    .padding(.horizontal, 16)
                    .padding(.top, 10)
                    .padding(.bottom, 24)
                }
                .scrollIndicators(.hidden)

        
                HStack(spacing: 12) {
                    Text("Select User")
                        .font(AppTheme.rubik(18))
                        .foregroundStyle(AppTheme.textPrimary)

                    Spacer()

                    Button {
                        UIImpactFeedbackGenerator(style: .light).impactOccurred()
                        dismiss()
                    } label: {
                        Image(systemName: "xmark")
                            .font(.system(size: 18, weight: .bold))
                            .foregroundStyle(AppTheme.textPrimary)
                            .frame(width: 44, height: 44)
                            .contentShape(Rectangle())
                    }
                }
                .padding(.horizontal, 16)
                .padding(.top, 20) 
            }
            .task { await vm.load() }
        }
        .tint(AppTheme.accent)
    }
}
