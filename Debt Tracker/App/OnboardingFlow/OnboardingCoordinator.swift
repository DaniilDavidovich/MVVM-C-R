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
    let notificationAction = ActionLocalNotificationManager(identifier: Constants.indentifire,
                                                            title: Constants.title, body: Constants.body, sound: .default)
    
    var router: OnboardingRouter?
    
    init() {
        self.router = OnboardingRouter(onboardingCoordinator: self)
    }
    
    lazy var onboardingVC: OnboardingViewController = {
        let onboardingVC = OnboardingViewController()
        onboardingVC.endOnboarding = { [weak self] in
            self?.router?.showMainScreen()
            self?.notificationAction.requestAndDispatchNotification()
      
        }
        return onboardingVC
    }()
    
    func start() {
        rootViewController = self.onboardingVC
    }
}

fileprivate enum Constants {
    static let indentifire = "Button"
    static let title = "Button is Taped".localised()
    static let body = "Hi, its Main Flow".localised()
}
