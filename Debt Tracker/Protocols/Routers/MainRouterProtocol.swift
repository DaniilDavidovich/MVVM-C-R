//
//  MainRouterProtocol.swift
//  Debt Tracker
//
//  Created by Daniil Davidovich on 28.09.23.
//

import Foundation
import UIKit

protocol MainRouterProtocol: AnyObject {
    func setupFirstTab() -> UIViewController
    func setupSecondTab() -> UIViewController
    func showTabBarController()
}
