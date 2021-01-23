import Foundation

// MARK: - TvShowDetails
struct TvShowDetails: Decodable {
    let id: Int?
    let overview: String?
    let popularity: Double?
    let posterPath: String?
    let runtime: [Int]?
    let name: String?
    let voteAverage: Double?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case overview = "overview"
        case popularity = "popularity"
        case posterPath = "poster_path"
        case runtime = "episode_run_time"
        case name = "name"
        case voteAverage = "vote_average"
    }
}
