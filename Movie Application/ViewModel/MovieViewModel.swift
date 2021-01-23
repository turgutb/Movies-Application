

import Foundation

protocol MovieViewModelProtocol: class {
    func didGetMovieData()
}


class MovieViewModel {
    weak var delegate: MovieViewModelProtocol?
    private var movies: [MovieResult] = []
    private var manager: NetworkManager = NetworkManager()
    
    func numberOfRow() -> Int {
        return movies.count
    }
    
    func cellForRow(at index: Int) -> MovieResult {
        return movies[index]
    }
    
    func getMovies(type: ListType) {
        manager.getMedia(type: type) { [weak self] (response: NetworkResponse<Movie, NetworkError>) in
            guard let self = self else { return }
            
            switch response {
            case .success(let result):
                self.movies = result.results
                self.delegate?.didGetMovieData()
                break
            case .failure(let error):
                print(error.errorMessage)
            }
        }
    }
}


