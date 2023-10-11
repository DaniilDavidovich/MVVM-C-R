//
//  File.swift
//  Debt Tracker
//
//  Created by Daniil Davidovich on 11.10.23.
//

import Foundation
import UserNotifications

class ActionLocalNotificationManager: NSObject, LocalNotificationManagerProtocol {
    
    var notificationCenter = UNUserNotificationCenter.current()
    var identifier: String
    var title: String
    var body: String
    var sound: UNNotificationSound
    
    init(identifier: String,
         title: String,
         body: String,
         sound: UNNotificationSound) {
        
        self.identifier = identifier
        self.title = title
        self.body = body
        self.sound = sound
        super.init()
        notificationCenter.delegate = self
    }
    
    func requestAndDispatchNotification() {
        notificationCenter.getNotificationSettings { settings in
            if settings.authorizationStatus == .authorized {
                self.setupRequest()
            } else if settings.authorizationStatus == .notDetermined {
                self.notificationCenter.requestAuthorization(options: [.alert, .sound]) { didAllow, eror in
                    if didAllow {
                        self.setupRequest()
                    }
                }
            }
        }
    }
    
    func setupContentNotification() -> UNMutableNotificationContent {
        let content = UNMutableNotificationContent()
        content.title = self.title
        content.body = self.body
        content.sound = self.sound
        return content
    }
    
    func setupTrigger() -> UNNotificationTrigger {
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 0.5, repeats: false)
        return trigger
    }
    
    func setupRequest() {
        let trigger = setupTrigger()
        let content = setupContentNotification()
        let request = UNNotificationRequest(identifier: self.identifier, content: content, trigger: trigger)
        
        notificationCenter.removePendingNotificationRequests(withIdentifiers: [self.identifier])
        notificationCenter.add(request)
    }
}

extension ActionLocalNotificationManager: UNUserNotificationCenterDelegate {
    
    // for App is Luanched!!!
    // when Notification show in Phone, if LAUNCHED
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.list, .banner])
        print(#function)
    }
    
    
    // when tap on Notification
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        print(#function)
    }
}




