//
//  MovieCell.swift
//  CinemaPlus
//
//  Created by Alparslan Cafer on 22.04.2023.
//

import UIKit

protocol MovieCellProtocol {
    var imageUrl  : String { get }
    var nameLabel : String { get }
    var imdbLabel : String { get }
    var dateLabel : String { get }
}

class MovieCell: UICollectionViewCell {
    @IBOutlet   private weak var movieImage    : UIImageView!
    @IBOutlet   private weak var nameLabel     : UILabel!
    @IBOutlet   private weak var imdbLabel     : UILabel!
    @IBOutlet   private weak var dateLabel     : UILabel!
    @IBOutlet   private weak var cellCollection: UICollectionView!
    
    let cellId = "\(CollectionCell.self)"
    var viewModel = MovieCellViewModel()
    
    override func layoutSubviews() {
        movieImage.layer.cornerRadius = 20
        cellCollection.register(UINib(nibName: cellId, bundle: nil),forCellWithReuseIdentifier: cellId)
    }
    
    func configureData() {
        viewModel.getMovieTitle()
        viewModel.successCallback = {
            self.cellCollection.reloadData()
        }
    }

    func confiqureImage(data: MovieCellProtocol) {
        nameLabel.text = data.nameLabel
        imdbLabel.text = data.imdbLabel
        dateLabel.text = data.dateLabel
        movieImage.loadUrl(data.imageUrl)
    }
}

extension MovieCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! CollectionCell
        cell.configureLabel(data: viewModel.items[indexPath.row])
        return cell
    }
}
