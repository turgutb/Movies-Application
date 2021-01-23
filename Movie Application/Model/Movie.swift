import Foundation

// MARK: - Movie
struct Movie: Codable {
    let results: [MovieResult]
}

// MARK: - MovieResult
struct MovieResult: Codable {
    let popularity: Double?
    let vote_count: Int?
    let poster_path: String?
    let id: Int
    let title: String
    let vote_average: Double?
    let overview: String?
    let release_date: String?
}
