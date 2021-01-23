

import UIKit


class MovieViewController: UIViewController {
   
    @IBOutlet weak var segmentedController: UISegmentedControl!
    @IBOutlet weak var movieTableView: UITableView!
    private let movieViewModel: MovieViewModel = MovieViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareUI()
        getData()
    }
    
    @IBAction func indexDidChange (_ sender: UISegmentedControl) {
        switch segmentedController.selectedSegmentIndex {
        case 0:
            movieViewModel.getMovies(type: .TopRateMovies)
        case 1:
            movieViewModel.getMovies(type: .PopularMovies)
        case 2:
            movieViewModel.getMovies(type: .NowPlayingMovies)
        default:
            break;
        }
    }
        
        private func prepareUI() {
            movieTableView.register(UINib(nibName:"CustomCell", bundle: nil), forCellReuseIdentifier: "MovieCell")
        }
        
        private func getData() {
            movieViewModel.delegate = self
            movieViewModel.getMovies(type: .TopRateMovies)
        }
        
    }
    
    
    extension MovieViewController: UITableViewDataSource {
       
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return movieViewModel.numberOfRow()
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = movieTableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! CustomCell
            let vm = movieViewModel.cellForRow(at: indexPath.row)
            cell.setView(name: vm.title,
                         rating: vm.vote_average,
                         date: vm.release_date,
                         posterPath: vm.poster_path,
                         popularity: vm.popularity)
            return cell
        }
    }

extension MovieViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let destinationVC = storyboard.instantiateViewController(identifier: "MovieDetails") as! DetailViewController
        let vm = movieViewModel.cellForRow(at: indexPath.row)
        destinationVC.detailsViewModel.detailID = vm.id
        destinationVC.detailsViewModel.categoryType = .Movies
        navigationController?.pushViewController(destinationVC, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }

    
    
}

extension MovieViewController: MovieViewModelProtocol {
    func didGetMovieData() {
        DispatchQueue.main.async {
            self.movieTableView.reloadData()
        }
    }
}
    

