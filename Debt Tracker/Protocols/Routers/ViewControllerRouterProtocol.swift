//
//  File.swift
//  Debt Tracker
//
//  Created by Daniil Davidovich on 28.09.23.
//

import Foundation
import UIKit

protocol ViewControllerRouterProtocol: AnyObject {
    func showDetailScreen(detailView: UIViewController)
}
