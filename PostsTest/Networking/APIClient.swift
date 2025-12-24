import Foundation

enum APIError: LocalizedError {
    case badStatus(Int)
    case decoding

    var errorDescription: String? {
        switch self {
        case .badStatus(let code): return "HTTP error: \(code)"
        case .decoding: return "Decoding error"
        }
    }
}

final class APIClient {
    static let shared = APIClient()
    private init() {}

    func fetch<T: Decodable>(_ type: T.Type, url: URL) async throws -> T {
        let (data, response) = try await URLSession.shared.data(from: url)

        if let http = response as? HTTPURLResponse, !(200...299).contains(http.statusCode) {
            throw APIError.badStatus(http.statusCode)
        }

        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            throw APIError.decoding
        }
    }
}
