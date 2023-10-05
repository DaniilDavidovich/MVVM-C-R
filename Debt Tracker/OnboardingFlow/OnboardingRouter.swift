//
//  OnboardingRouter.swift
//  Debt Tracker
//
//  Created by Daniil Davidovich on 27.09.23.
//

import Foundation

protocol OnboardingRouterProtocol: AnyObject {
    func showMainScreen()
}

class OnboardingRouter: OnboardingRouterProtocol {
    
    weak var onboardingCoordinator: OnboardingCoordinator?
    let notificationManager = NotificationManager<Bool>()
    
    init(onboardingCoordinator: OnboardingCoordinator) {
        self.onboardingCoordinator = onboardingCoordinator
    }
    
    func showMainScreen() {
        notificationManager.post(name: "bool", value: true)
        print(#function)
    }
}
