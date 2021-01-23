//
//  DetailCell.swift
//  Movie Application
//
//  Created by MacBook on 18.12.2020.
//

import UIKit

class DetailCell: UITableViewCell {
    
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieNameLabel: UILabel!
    @IBOutlet weak var movieDescriptionLabel: UILabel!
    @IBOutlet weak var movieRatingLabel: UILabel!
    @IBOutlet weak var movieRuntimeLabel: UILabel!
    @IBOutlet weak var moviePopularityLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    func setView(name: String?, posterPath: String?, description: String?, rating: Double?, popularity: Double?, runtime: Int?) {
        movieNameLabel.text = name
        movieDescriptionLabel.text = description
        ImageLoader().loadImage(with: posterPath, image: movieImageView)
        
        if let rating = rating, let popularity = popularity {
            moviePopularityLabel.text = String(popularity)
            movieRatingLabel.text = String(rating)
        }
        
        if let runtime = runtime {
            movieRuntimeLabel.text = String(runtime) + "min"
        }
    }
}
