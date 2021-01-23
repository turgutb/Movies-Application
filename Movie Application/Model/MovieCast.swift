import Foundation

// MARK: - MovieCast
struct MovieCast: Decodable {
    let cast: [Cast]
}

// MARK: - Cast
struct Cast: Decodable {
    let character: String?
    let name: String?
    let profile_path: String?
}
