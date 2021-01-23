import Foundation

// MARK: - TvShow
struct TvShow: Codable {
    let results: [TvShowResult]
}

// MARK: - TvShowResult
struct TvShowResult: Codable {
    let name: String
    let vote_count: Int?
    let first_air_date : String?
    let id: Int
    let vote_average: Double?
    let poster_path: String?
    let popularity: Double?
}
