//
//  SecondTabCoordinator.swift
//  Debt Tracker
//
//  Created by Daniil Davidovich on 26.09.23.
//

import Foundation
import UIKit


class SecondTabCoordinator: CoordinatorProtocol {
    
    var navigationController = UINavigationController()
    
    var router: SecondTabRouter?
    
    let notificationManager = NotificationManager<Bool>()
    
    init() {
    
        self.router = SecondTabRouter(coordinator: self)
      
    }
    
    lazy var secondViewController: SecondViewController = {
        
        let secondViewController = SecondViewController()
        secondViewController.pushToDetail = {
            self.router?.showDetailScreen(detailView: self.secondDetailViewController)
        }
        
        return secondViewController
    }()
    
    lazy var secondDetailViewController: SecondDetailViewController = {
        let secondDetailViewController = SecondDetailViewController()
        secondDetailViewController.showOnboardingFlow = {
            self.notificationManager.post(name: "bool", value: false)
        }
        
        return secondDetailViewController
    }()
    
    func start() {
        navigationController.setViewControllers([secondViewController], animated: true)
    }
}
