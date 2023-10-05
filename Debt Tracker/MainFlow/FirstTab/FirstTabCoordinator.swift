//
//  FirstTabCoordinator.swift
//  Debt Tracker
//
//  Created by Daniil Davidovich on 26.09.23.
//

import Foundation
import UIKit


class FirstTabBarCoordinator: CoordinatorProtocol {
    
    let navigationController: UINavigationController?
    
    var router: FirstViewControllerRouter?
    
    let firstTabViewModel = FirstTabViewModel()
    
    init() {
        navigationController = UINavigationController()
        navigationController?.navigationBar.prefersLargeTitles = true
        self.router = FirstViewControllerRouter(coordinator: self)
    }
    
    lazy var firstViewController: FirstViewController = {
        let vc = FirstViewController(viewModel: firstTabViewModel)
        vc.title = "First View Controller"
        vc.pushCloser = { [weak self] in 
            guard let self = self else { return }
            self.router?.showDetailScreen(detailView: self.firstDetailViewController)
        }
        return vc
    }()
    
    lazy var firstDetailViewController: FirstDetailViewController = {
        var firstDetailViewController = FirstDetailViewController(viewModel: self.firstTabViewModel)
        
        return firstDetailViewController
    }()
    
    func start() {
        navigationController?.setViewControllers([firstViewController], animated: true)
    }
    
}
