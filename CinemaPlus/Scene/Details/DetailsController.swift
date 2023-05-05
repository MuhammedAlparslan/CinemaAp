//
//  DetailsController.swift
//  CinemaPlus
//
//  Created by Alparslan Cafer on 22.04.2023.
//

import UIKit

class DetailsController: UIViewController {
    
    @IBOutlet private weak var detailsCollectionView: UICollectionView!
    
    var viewModel = DetailsViewModel()
    let cellId = "\(MovieCell.self)"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViewModel()
        configureUI()
        
    }
    
    
    private func configureUI() {
        navigationItem.title = "Movie List"
        detailsCollectionView.register(UINib(nibName: cellId, bundle: nil), forCellWithReuseIdentifier: cellId)
    }
    
    private func configureViewModel() {
        viewModel.getMovieDetails()
        viewModel.successCallback = {
            self.detailsCollectionView.reloadData()
        }
    }
}
    

extension DetailsController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MovieCell
        cell.confiqureImage(data: viewModel.items[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: detailsCollectionView.frame.width, height: 120)
    }
}


