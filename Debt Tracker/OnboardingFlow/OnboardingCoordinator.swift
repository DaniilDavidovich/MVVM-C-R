//
//  OnboardingCoordinator.swift
//  Debt Tracker
//
//  Created by Daniil Davidovich on 26.09.23.
//

import Foundation
import UIKit

class OnboardingCoordinator: CoordinatorProtocol {
    
    var rootViewController = UIViewController()
    
    var router: OnboardingRouter?
    
    init() {
        self.router = OnboardingRouter(onboardingCoordinator: self)
    }
    
    lazy var onboardingVC: OnboardingViewController = {
        let onboardingVC = OnboardingViewController()
        onboardingVC.endOnboarding = { [weak self] in
            self?.router?.showMainScreen()
        }
        return onboardingVC
    }()
    
    func start() {
        rootViewController = self.onboardingVC
    }
}
