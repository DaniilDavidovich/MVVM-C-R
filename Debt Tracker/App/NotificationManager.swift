//
//  NotificationManager.swift
//  Debt Tracker
//
//  Created by Daniil Davidovich on 5.10.23.
//

import Foundation

protocol NotificationManagerProtocol {
    associatedtype T
    
    func addObserver(name: String, handler: @escaping (T) -> Void)
    func post(name: String, value: T)
}

class NotificationManager<T>: NotificationManagerProtocol {
    
    private let notificationCenter = NotificationCenter.default
        
    func addObserver(name: String, handler: @escaping (T) -> Void) {
        
        notificationCenter.addObserver(
            forName: Notification.Name(name),
            object: nil,
            queue: .main)
        { [weak self] notification in
            guard self != nil else { return }
            
            if let value = notification.userInfo as? [String: T],
               let unwrappedValue = value.values.first {
                handler(unwrappedValue)
            }
        }
    }
    
    func post(name: String, value: T) {
        NotificationCenter.default.post(
            name: Notification.Name(name),
            object: nil,
            userInfo: ["value": value])
    }
}
