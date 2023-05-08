//
//  ActorCoordinator.swift
//  CinemaPlus
//
//  Created by Alparslan Cafer on 8.05.2023.
//

import Foundation
import UIKit

class ActorCoordinator: CoreCoordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func showActorController(actorId: Int) {
        let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "DetailsController") as! DetailsController
        controller.viewModel.actorId = actorId
        navigationController.show(controller, sender: nil)
    }
    
}

