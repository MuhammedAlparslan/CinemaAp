//
//  HomeCell.swift
//  CinemaPlus
//
//  Created by Alparslan Cafer on 14.04.2023.
//

import UIKit

class HomeCell: UICollectionViewCell {
    @IBOutlet private weak var cellCollection: UICollectionView!
    @IBOutlet private weak var nameLabel     : UILabel!
    
    private var movieItems = [MovieResult]()
    
    let cellId = "\(ImageLabelCell.self)"
    
     func configure(data: Category) {
        movieItems = data.items
         nameLabel.text = data.title
        cellCollection.register(UINib(nibName: cellId, bundle: nil),forCellWithReuseIdentifier: cellId)
        cellCollection.reloadData()
    }
}

extension HomeCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        movieItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ImageLabelCell
        cell.confiqure(data: movieItems[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 167, height: cellCollection.frame.height)
    }
}
