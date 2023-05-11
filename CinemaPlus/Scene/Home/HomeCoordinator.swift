//
//  HomeCoordinator.swift
//  CinemaPlus
//
//  Created by Alparslan Cafer on 8.05.2023.
//

import Foundation
import UIKit
import PanModal

class HomeCoordinator: CoreCoordinator {
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func showClickedController() {
        let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "SearchController") as! SearchController
        navigationController.show(controller, sender: nil)
    }
    
    func showClickedCategory(vc: HomeController) {
        let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "CategoryController") as! CategoryController
        controller.delegate = vc
        navigationController.presentPanModal(controller, sourceView: nil)
    }
    
    func showClickedCategory2(complete: @escaping((HomeCategory)->())) {
        let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "CategoryController") as! CategoryController
        controller.didCategorySelected = { category in
            complete(category)
        }
        navigationController.presentPanModal(controller, sourceView: nil)
    }
}
