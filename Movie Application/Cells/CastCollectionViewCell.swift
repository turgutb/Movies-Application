//
//  CastCollectionViewCell.swift
//  Movie Application
//
//  Created by MacBook on 18.12.2020.
//

import UIKit

class CastCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var castImageView: UIImageView!
    @IBOutlet weak var castCharacterLabel: UILabel!
    @IBOutlet weak var castNameLabel: UILabel!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setView(imagePath: String?, character: String?, name: String?) {
        castCharacterLabel.text = character
        castNameLabel.text = name
        ImageLoader().loadImage(with: imagePath, image: castImageView)
    }
}



