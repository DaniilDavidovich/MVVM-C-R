//
//  File.swift
//  Debt Tracker
//
//  Created by Daniil Davidovich on 11.10.23.
//

import Foundation
import UserNotifications

protocol LocalNotificationManagerProtocol {
    
    var notificationCenter: UNUserNotificationCenter { get set }
    var identifier: String { get set }
    var title: String { get set }
    var body: String { get set }
    var sound: UNNotificationSound { get set }
    
    func requestAndDispatchNotification()
    func setupContentNotification() -> UNMutableNotificationContent
    func setupTrigger() -> UNNotificationTrigger
    func setupRequest()
}
