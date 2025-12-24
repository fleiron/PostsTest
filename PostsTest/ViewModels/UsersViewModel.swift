import Foundation
import Combine

@MainActor
final class UsersViewModel: ObservableObject {
    @Published var users: [User] = []
    @Published var isLoading = false
    @Published var errorText: String?

    func load() async {
        isLoading = true
        errorText = nil

        do {
            users = try await APIClient.shared.fetch([User].self, url: APIEndpoints.users())
        } catch {
            errorText = error.localizedDescription
            users = []
        }

        isLoading = false
    }
}
