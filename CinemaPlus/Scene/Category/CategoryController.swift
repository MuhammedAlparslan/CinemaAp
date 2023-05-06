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
    var callBack: ((Category) -> ())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

extension CategoryController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell") as! CategoryCell
        cell.configure(data: viewModel.items[indexPath.item].rawValue.localizable)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        dismiss(animated: true)
    }
}

extension CategoryController: PanModalPresentable {
    
    var panScrollable: UIScrollView? {
        return categoryTableView
    }
    
    var shortFormHeight: PanModalHeight {
        return .contentHeight(300)
    }
    
    var longFormHeight: PanModalHeight {
        return .maxHeightWithTopInset(40)
    }
}
