//
//  HomeCoordinator.swift
//  CinemaPlus
//
//  Created by Alparslan Cafer on 8.05.2023.
//

import Foundation
import UIKit

class HomeCoordinator: CoreCoordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func showClickedController() {
        let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "SearchController") as! SearchController
        navigationController.show(controller, sender: nil)
    }
    
}


