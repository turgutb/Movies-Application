//
//  CastCell.swift
//  Movie Application
//
//  Created by MacBook on 18.12.2020.
//

import UIKit

class CastCell: UITableViewCell {
    
    @IBOutlet weak var castCollectionView: UICollectionView!
    public var categoryType: CategoryType? = nil
    
    var movieCast: [Cast] = [] {
        didSet {
            castCollectionView.reloadData()
        }
    }
    
    var showCast: [ShowCast] = [] {
        didSet {
            castCollectionView.reloadData()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        castCollectionView.dataSource = self
        castCollectionView.register(UINib(nibName: "CastCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CastCollection")
        setItemSize()
    }
    
    func setItemSize() {
        let width = (self.frame.width-20)/3
        let height = (self.frame.width-20)/2
        let layout = castCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: width, height: height)
    }
}
extension CastCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if categoryType == .Movies {
            return movieCast.count
        } else {
            return showCast.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = castCollectionView.dequeueReusableCell(withReuseIdentifier: "CastCollection", for: indexPath) as! CastCollectionViewCell
        if categoryType == .Movies {
            let vm = movieCast[indexPath.row]
            cell.setView(imagePath: vm.profile_path, character: vm.character, name: vm.name)
        } else {
            let vm = showCast[indexPath.row]
            cell.setView(imagePath: vm.profile_path, character: vm.character, name: vm.name)
        }
        return cell
    }
}
