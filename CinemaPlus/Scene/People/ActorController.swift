//
//  ActorController.swift
//  CinemaPlus
//
//  Created by Alparslan Cafer on 17.04.2023.
//

import UIKit

class ActorController: UIViewController  {
    @IBOutlet private weak var actorCollection: UICollectionView!
    
    private var viewModel = PeopleViewModel()
    private let cellId = "\(ImageLabelCell.self)"
    private let refreshController = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        confiqureViewModel()
    }
    
    private func configureUI() {
        navigationItem.title = "Actors and Actresses"
        refreshController.addTarget(self, action: #selector(pullToRefresh), for: .valueChanged)
        actorCollection.refreshControl = refreshController
        actorCollection.refreshControl?.tintColor = .purple
        actorCollection.register(UINib(nibName: cellId, bundle: nil), forCellWithReuseIdentifier: cellId)
    }
    
    private func confiqureViewModel() {
        refreshController.beginRefreshing()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.viewModel.getPopularPeople()
        }
        viewModel.successCallback =  {
            self.refreshController.endRefreshing()
            self.actorCollection.reloadData()
        }
    }
    
    @objc func pullToRefresh() {
        viewModel.reset()
        actorCollection.reloadData()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.viewModel.getPopularPeople()
        }
    }
}

extension ActorController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let controller = storyboard?.instantiateViewController(identifier: "DetailsController") as! DetailsController
        controller.viewModel.actorId = viewModel.items[indexPath.row].id ?? 0
        navigationController?.show(controller, sender: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = actorCollection.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ImageLabelCell
        cell.confiqure(data: viewModel.items[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: actorCollection.frame.width / 2 - 10, height: 220)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        viewModel.pagination(index: indexPath.item)
    }
}
