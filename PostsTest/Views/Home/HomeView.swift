import SwiftUI
import UIKit

struct HomeView: View {
    @StateObject var vm = HomeViewModel(userId: 1)
    @State var isUserPickerPresented = false

    var body: some View {
        NavigationStack {
            ZStack {
                BackgroundView()

                VStack(spacing: 0) {
                    topBar
                    content
                }
            }
            .toolbar(.hidden, for: .navigationBar)
            .sheet(isPresented: $isUserPickerPresented) {
                UserPickerView(selectedUserId: vm.userId) { user in
                    Task { await vm.selectUser(user) }
                }
                .presentationDetents([.medium, .large])
                .presentationDragIndicator(.visible)
            }
            .task {
                await vm.loadIfNeeded()
            }
        }
        .tint(AppTheme.accent)
    }
}
