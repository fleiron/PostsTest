import Foundation

enum APIEndpoints {
    static let base = "https://jsonplaceholder.typicode.com"

    static func user(id: Int) -> URL {
        URL(string: "\(base)/users/\(id)")!
    }

    static func posts(userId: Int) -> URL {
        URL(string: "\(base)/posts?userId=\(userId)")!
    }

    static func comments(postId: Int) -> URL {
        URL(string: "\(base)/comments?postId=\(postId)")!
    }
    static func users() -> URL {
        URL(string: "\(base)/users")!
    }
}
