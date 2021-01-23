
import Foundation

protocol DetailViewModelProtocol: class {
    func didGetDetails()
}

class DetailViewModel {
    weak var delegate: DetailViewModelProtocol?
    public var detailID: Int = Int()
    public var categoryType: CategoryType? = nil
    private var details: MovieDetails? = nil
    private var tvDetails: TvShowDetails? = nil
    private var manager: NetworkManager = NetworkManager()
    private var tvCast: [ShowCast] = []
    private var cast: [Cast] = []
    
    func getMovieDetails() -> MovieDetails? {
        return details
    }
    
    func getTvDetails() -> TvShowDetails? {
        return tvDetails
    }
    
    func getTvCast() -> [ShowCast] {
        return tvCast
    }
    
    func getMovieCast() -> [Cast] {
        return cast
    }
    
    func getMovieDetails(type: ListType) {
        manager.getDetails(mediaID: detailID, type: type) { [weak self] (response: NetworkResponse<MovieDetails, NetworkError>) in
            guard let self = self else { return }
            switch response {
            case .success(let result):
                self.details = result
                self.delegate?.didGetDetails()
                break
            case .failure(let error):
                print(error.errorMessage)
            }
        }
    }
    
    func getMovieCast(type: ListType) {
        manager.getDetails(mediaID: detailID, type: type) { [weak self] (response: NetworkResponse<MovieCast, NetworkError>) in
            guard let self = self else { return }
                        
            switch response {
            case .success(let result):
                self.cast = result.cast
                self.delegate?.didGetDetails()
                break
            case .failure(let error):
                print(error.errorMessage)
            
            }
        }
    }
    
    func getShowDetails(type: ListType) {
        manager.getDetails(mediaID: detailID, type: type) { [weak self] (response: NetworkResponse<TvShowDetails, NetworkError>) in
            guard let self = self else { return }
            
            switch response {
            case .success(let result):
                self.tvDetails = result
                self.delegate?.didGetDetails()
                break
            case .failure(let error):
                print(error.errorMessage)
            }
        }
    }
    
    func getShowCast(type: ListType) {
        manager.getDetails(mediaID: detailID, type: type) { [weak self] (response: NetworkResponse<TvShowCast, NetworkError>) in
            guard let self = self else { return }
            
            switch response {
            case .success(let result):
                self.tvCast = result.cast
                self.delegate?.didGetDetails()
                break
            case .failure(let error):
                print(error.errorMessage)
            }
        }
    }
}
