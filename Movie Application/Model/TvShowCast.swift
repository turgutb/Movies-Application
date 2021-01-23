import Foundation

// MARK: - TvShowCast
struct TvShowCast: Decodable {
    let cast: [ShowCast]
}

// MARK: - ShowCast
struct ShowCast: Decodable {
    let character: String?
    let name: String?
    let profile_path: String?
}
