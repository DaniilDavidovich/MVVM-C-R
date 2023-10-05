//
//  AppCoordinator.swift
//  Debt Tracker
//
//  Created by Daniil Davidovich on 25.09.23.
//

import Foundation
import UIKit
import SnapKit

class AppCoordinator: CoordinatorProtocol {
    
    var window: UIWindow?
    
    var router: AppRouter?
    
    var childCoordinatrors = [CoordinatorProtocol]()
    
    let notificationManager = NotificationManager<Bool>()
    
    init(window: UIWindow?) {
        self.window = window
        router = AppRouter(appCoordinator: self)
    }
    
    func start() {
        notificationManager.addObserver(name: "bool") { bool in
            self.router?.showFlow(isMainFlow: bool)
        }
        notificationManager.post(name: "bool", value: false)
    }
}
