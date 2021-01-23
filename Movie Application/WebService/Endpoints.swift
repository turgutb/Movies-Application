

import Foundation

enum EndPoints: String {
    
    case getPopular  = "/movie/popular?"
    case getTopRates = "/movie/top_rated?"
    case getNowPlaying  = "/movie/now_playing?"
    case getGenres = "/genre/movie/list?"
    case getPopularTv  = "/tv/popular?"
    case getTopRatesTv = "/tv/top_rated?"
    case getMovieDetails = "/movie/"
    case getTvDetails = "/tv/"
    
}
