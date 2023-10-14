//
//  MainCoordinator.swift
//  Debt Tracker
//
//  Created by Daniil Davidovich on 26.09.23.
//

import Foundation
import UIKit

class MainCoordinator: CoordinatorProtocol {
    
    var rootViewController: UITabBarController?
    
    var router: MainRouter?
    
    var childCoordinators = [CoordinatorProtocol]()
    
    init() {
        self.rootViewController = UITabBarController()
        rootViewController?.tabBar.backgroundColor = .systemGray
        rootViewController?.tabBar.isTranslucent = true
        rootViewController?.selectedIndex = 0
        self.router = MainRouter(coordinator: self)
    }
    
    func start() {
        router?.showTabBarController()
    }
}
