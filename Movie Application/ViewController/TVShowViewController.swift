//
//  TVViewController.swift
//  Movie Application
//
//  Created by MacBook on 3.11.2020.
//

import UIKit

class TvShowViewController: UIViewController {
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var tvShowTableView: UITableView!
    
    private let tvShowViewModel: TvShowViewModel = TvShowViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareUI()
        getData()
    }

    
    @IBAction func indexDidChange(_ sender: UISegmentedControl) {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            tvShowViewModel.getShows(type: .PopularShows)
        case 1:
            tvShowViewModel.getShows(type: .TopRatedShows)
        default:
            break;
        }
    }
    
    private func prepareUI() {
        tvShowTableView.register(UINib(nibName: "CustomCell", bundle: nil), forCellReuseIdentifier: "TvCell")
    }
    
    private func getData() {
        tvShowViewModel.delegate = self
        tvShowViewModel.getShows(type: .PopularShows)
    }
}

// MARK: - UITableViewDataSource
extension TvShowViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tvShowViewModel.numberOfRow()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tvShowTableView.dequeueReusableCell(withIdentifier: "TvCell", for: indexPath) as! CustomCell
        let vm = tvShowViewModel.cellForRow(at: indexPath.row)
        cell.setView(name: vm.name,
                     rating: vm.vote_average,
                     date: vm.first_air_date,
                     posterPath: vm.poster_path,
                     popularity: vm.popularity)
        return cell
    }
}

// MARK: - UITableViewDelegate
extension TvShowViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let destinationVC = storyboard.instantiateViewController(identifier: "MovieDetails") as! DetailViewController
        let vm = tvShowViewModel.cellForRow(at: indexPath.row)
        destinationVC.detailsViewModel.detailID = vm.id
        destinationVC.detailsViewModel.categoryType = .TvShows
        navigationController?.pushViewController(destinationVC, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

// MARK: - TvShowViewModelProtocol
extension TvShowViewController: TvShowViewModelProtocol {
    func didGetShowData() {
        DispatchQueue.main.async {
            self.tvShowTableView.reloadData()
        }
    }
}
