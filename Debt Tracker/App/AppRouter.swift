//
//  AppCoordinatorRouter.swift
//  Debt Tracker
//
//  Created by Daniil Davidovich on 27.09.23.
//

import Foundation



class AppRouter: AppRouterProtocol {
    
    weak var appCoordinator: AppCoordinator?
    
    init(appCoordinator: AppCoordinator?) {
        self.appCoordinator = appCoordinator
    }
    
    func showMainScreen() {
        let mainCoordinator = MainCoordinator()
        mainCoordinator.start()
        appCoordinator?.childCoordinatrors.append(mainCoordinator)
        appCoordinator?.window?.rootViewController = mainCoordinator.rootViewController
    }
    
    func showOnboardingScreen() {
        
        let onboardingCoordinator = OnboardingCoordinator()
        onboardingCoordinator.start()
        appCoordinator?.childCoordinatrors.append(onboardingCoordinator)
        appCoordinator?.window?.rootViewController = onboardingCoordinator.rootViewController
    }
    
    func showFlow(isMainFlow: Bool) {
        if isMainFlow {
            showMainScreen()
        } else {
            showOnboardingScreen()
        }
    }
}
