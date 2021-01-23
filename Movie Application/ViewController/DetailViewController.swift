//
//  DetailViewController.swift
//  Movie Application
//
//  Created by MacBook on 20.11.2020.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailsTableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    let detailsViewModel: DetailViewModel = DetailViewModel()
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
       switchTypeToLoad()
       prepareUI()
        
    }
    
    private func prepareUI() {
        
        navigationItem.largeTitleDisplayMode = .never
        detailsTableView?.register(UINib(nibName: "DetailCell", bundle: nil), forCellReuseIdentifier: "MovieCell")
        detailsTableView?.register(UINib(nibName: "CastCell", bundle: nil), forCellReuseIdentifier: "CastCell")
        activityIndicator?.startAnimating()
    }
    
    private func configureUI() {
        
        activityIndicator?.stopAnimating()
        activityIndicator?.isHidden = true
        detailsTableView?.isHidden = false
    }
    
    private func switchTypeToLoad () {
        detailsViewModel.delegate = self
        
        if detailsViewModel.categoryType == .Movies {
            detailsViewModel.getMovieCast(type: .MovieCast)
            detailsViewModel.getMovieDetails(type: .MovieDetails)
        } else {
            detailsViewModel.getShowCast(type: .TvCast)
            detailsViewModel.getShowDetails(type: .TvDetails)
        }
    }
}

// MARK: - DetailViewModelProtocol
extension DetailViewController: DetailViewModelProtocol {
    func didGetDetails() {
        DispatchQueue.main.async {
            self.detailsTableView?.reloadData()
            self.configureUI()
        }
    }
}

// MARK: - UITableViewDataSource
extension DetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = detailsTableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! DetailCell
            if detailsViewModel.categoryType == .Movies {
                let movieDetail = detailsViewModel.getMovieDetails()
                cell.setView(name: movieDetail?.name,
                             posterPath: movieDetail?.posterPath,
                             description: movieDetail?.overview,
                             rating: movieDetail?.voteAverage,
                             popularity: movieDetail?.popularity,
                             runtime: movieDetail?.runtime)
            } else {
                let showDetail = detailsViewModel.getTvDetails()
                cell.setView(name: showDetail?.name,
                             posterPath: showDetail?.posterPath,
                             description: showDetail?.overview,
                             rating: showDetail?.voteAverage,
                             popularity: showDetail?.popularity,
                             runtime: showDetail?.runtime?.first)
            }
            return cell
            
        } else {
            let cell = detailsTableView.dequeueReusableCell(withIdentifier: "CastCell", for: indexPath) as! CastCell
            if detailsViewModel.categoryType == .Movies {
                let movieCast = detailsViewModel.getMovieCast()
                cell.categoryType = .Movies
                cell.movieCast = movieCast
            } else {
                let showCast = detailsViewModel.getTvCast()
                cell.categoryType = .TvShows
                cell.showCast = showCast
            }
            return cell
        }
    }
}
   













