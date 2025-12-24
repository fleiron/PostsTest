import Foundation
import Combine

@MainActor
final class HomeViewModel: ObservableObject {
    @Published var userId: Int
    @Published var userName: String = "Loading…"
    @Published var posts: [Post] = []
    @Published var isLoading = false

    private var hasLoadedOnce = false

    init(userId: Int = 1) {
        self.userId = userId
    }

    func loadIfNeeded() async {
        guard !hasLoadedOnce else { return }
        hasLoadedOnce = true
        await load(force: true)
    }

    func load(force: Bool = false) async {
        if isLoading && !force { return }

        isLoading = true

        do {
            let user = try await APIClient.shared.fetch(User.self, url: APIEndpoints.user(id: userId))
            userName = user.name

            let posts = try await APIClient.shared.fetch([Post].self, url: APIEndpoints.posts(userId: userId))
            self.posts = posts
        } catch is CancellationError {
       
        } catch {
            
        }

        isLoading = false
    }

    func selectUser(_ user: User) async {
        userId = user.id
        userName = user.name
        await load(force: true)
    }
}
