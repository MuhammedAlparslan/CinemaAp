//
//  HomeController.swift
//  CinemaPlus
//
//  Created by Alparslan Cafer on 14.04.2023.
//

import UIKit

class HomeController: UIViewController {
    @IBOutlet private weak var homeCollection: UICollectionView!
    @IBOutlet private weak var titleLabel: UILabel!
    
    var viewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        confiqureViewModel()
    }
    override func viewWillAppear(_ animated: Bool) {
        configureUI()
    }
    
    private func configureUI() {
        titleLabel.text = "home_title".localizable
        homeCollection.reloadData()
    }
    
    private func confiqureViewModel() {
        viewModel.getItems()
        viewModel.successCallback = {
            self.homeCollection.reloadData()
        }
    }
    
    @IBAction func searchBarClicked(_ sender: Any) {
        let controller = storyboard?.instantiateViewController(identifier: "SearchController") as! SearchController
        navigationController?.show(controller, sender: nil)
    }
    
    @IBAction func categryClicked(_ sender: UIBarButtonItem) {
                let controller = storyboard?.instantiateViewController(identifier: "CategoryController") as! CategoryController
                navigationController?.presentPanModal(controller, sourceView: nil)
            }
    }


extension HomeController: UICollectionViewDelegate, UICollectionViewDataSource,  UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.category.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCell", for: indexPath) as! HomeCell
        cell.configure(data: viewModel.category[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: homeCollection.frame.width, height: 318)
    }
}
