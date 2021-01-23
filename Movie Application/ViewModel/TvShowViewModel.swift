import Foundation


protocol TvShowViewModelProtocol: class {
    func didGetShowData()
}

class TvShowViewModel {
    weak var delegate: TvShowViewModelProtocol?
    private var shows: [TvShowResult] = []
    private var manager: NetworkManager = NetworkManager()
    
    func numberOfRow() -> Int {
        return shows.count
    }
    
    func cellForRow(at index: Int) -> TvShowResult {
        return shows[index]
    }
    
    func getShows(type: ListType){
        manager.getMedia(type: type) { [weak self] (response: NetworkResponse<TvShow, NetworkError>) in
            guard let self = self else { return }
            
            switch response {
            case .success(let result):
                self.shows = result.results
                self.delegate?.didGetShowData()
                break
            case .failure(let error):
                print(error.errorMessage)
            }
        }
    }
}
