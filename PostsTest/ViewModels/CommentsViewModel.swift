
import Foundation
import Combine

@MainActor
final class CommentsViewModel: ObservableObject {
    @Published var comments: [Comment] = []
    @Published var isLoading = false
    @Published var errorText: String?

    let postId: Int

    init(postId: Int) {
        self.postId = postId
    }

    func load() async {
        isLoading = true
        errorText = nil

        do {
            comments = try await APIClient.shared.fetch([Comment].self, url: APIEndpoints.comments(postId: postId))
        } catch {
            errorText = error.localizedDescription
            comments = []
        }

        isLoading = false
    }
}
