import Foundation

// MARK: - MovieDetails
struct MovieDetails: Decodable {
    let id: Int?
    let overview: String?
    let popularity: Double?
    let posterPath: String?
    let runtime: Int?
    let name: String?
    let voteAverage: Double?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case overview = "overview"
        case popularity = "popularity"
        case posterPath = "poster_path"
        case runtime = "runtime"
        case name = "title"
        case voteAverage = "vote_average"
    }
}
