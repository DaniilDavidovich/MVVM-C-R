//
//  SecondTabBarRouter.swift
//  Debt Tracker
//
//  Created by Daniil Davidovich on 28.09.23.
//

import Foundation
import UIKit

class SecondTabRouter: ViewControllerRouterProtocol {
    
    weak var coordinator: SecondTabCoordinator?
    
    init(coordinator: SecondTabCoordinator) {
        self.coordinator = coordinator
    }
    
    func showDetailScreen(detailView: UIViewController) {
        coordinator?.navigationController.pushViewController(detailView, animated: true)
    }
}
