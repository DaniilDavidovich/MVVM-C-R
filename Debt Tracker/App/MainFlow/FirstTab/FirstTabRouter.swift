//
//  FirstTabRouterProtocol.swift
//  Debt Tracker
//
//  Created by Daniil Davidovich on 28.09.23.
//

import Foundation
import UIKit

class FirstViewControllerRouter: ViewControllerRouterProtocol {
   
    weak var coordinator: FirstTabBarCoordinator?
    
    init(coordinator: FirstTabBarCoordinator) {
        self.coordinator = coordinator
    }
    
    func showDetailScreen(detailView: UIViewController) {
        coordinator?.navigationController?.pushViewController(detailView, animated: true)
    }
}
