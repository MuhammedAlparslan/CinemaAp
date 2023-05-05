//
//  SearchController.swift
//  CinemaPlus
//
//  Created by Alparslan Cafer on 23.04.2023.
//

import UIKit


class SearchController: UIViewController  {
    @IBOutlet private weak var searchCollection : UICollectionView!
    
    var viewModel = SearchViewModel()
    private let cellId = "\(MovieCell.self)"
    private let refreshController = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureData()
        configureUI()
    }
    
    func configureUI() {
        searchCollection.register(UINib(nibName: cellId, bundle: nil), forCellWithReuseIdentifier: cellId)
        refreshController.addTarget(self, action: #selector(pullToRefresh), for: .valueChanged)
        searchCollection.refreshControl = refreshController
        searchCollection.refreshControl?.tintColor = .purple
    }
    
    func configureData() {
        refreshController.beginRefreshing()
        viewModel.successCallback =  {
            self.refreshController.endRefreshing()
            self.searchCollection.reloadData()
        }
    }
    
    @objc func pullToRefresh() {
        viewModel.reset()
        searchCollection.reloadData()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.viewModel.fetchData()
        }
    }
    
    @IBAction func SearchBar(_ sender: UITextField) {
        viewModel.text = sender.text ?? ""
    }
}

extension SearchController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MovieCell
        cell.confiqureImage(data: viewModel.items[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: searchCollection.frame.width  , height: 120)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        viewModel.pagination(index: indexPath.item)
    }
}
