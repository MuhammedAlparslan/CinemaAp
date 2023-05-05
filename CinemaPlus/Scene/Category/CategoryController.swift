//
//  CategoryController.swift
//  CinemaPlus
//
//  Created by Alparslan Cafer on 2.05.2023.
//

import UIKit
import PanModal

class CategoryController: UIViewController {
    @IBOutlet private weak var categoryTableView: UITableView!
    
    let viewModel = CategoryViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        
    }
    
    func configure() {
        viewModel.getItems()
        viewModel.successCallback = {
            self.categoryTableView.reloadData()
        }
        
    }
}


extension CategoryController: UITableViewDelegate, UITableViewDataSource, PanModalPresentable {
    var panScrollable: UIScrollView? {
    return categoryTableView
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.category.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell") as! CategoryCell
        cell.configure(data: viewModel.category[indexPath.row])
        return cell
    }
  
    
    var shortFormHeight: PanModalHeight {
        return .contentHeight(300)
    }

    var longFormHeight: PanModalHeight {
        return .maxHeightWithTopInset(40)
    }
    
    
}
