//
//  UserNotificationCenterManager.swift
//  Debt Tracker
//
//  Created by Daniil Davidovich on 10.10.23.
//

import Foundation
import UserNotifications

class TimerLocalNotificationManager: NSObject, LocalNotificationManagerProtocol, UNUserNotificationCenterDelegate {
  
    var notificationCenter = UNUserNotificationCenter.current()
    
    var identifier: String
    var title: String
    var body: String
    var sound: UNNotificationSound
    var hour: Int
    var minute: Int
    
    init(identifier: String,
         title: String,
         body: String,
         sound: UNNotificationSound, 
         hour: Int, minute: Int) {
        
        self.identifier = identifier
        self.title = title
        self.body = body
        self.sound = sound
        self.hour = hour
        self.minute = minute
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
        content.sound = self.sound
        content.body = self.body
        return content
    }
    
    func setupTrigger() -> UNNotificationTrigger {
        let calendar = Calendar.current
        var dateComponents = DateComponents(calendar: calendar, timeZone: TimeZone.current)
        dateComponents.hour = self.hour
        dateComponents.minute = self.minute
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        return trigger
    }
    
    func setupRequest() {
        
        var trigger = setupTrigger()
        let content = setupContentNotification()
        let request = UNNotificationRequest(identifier: self.identifier, content: content, trigger: trigger)
        
        notificationCenter.removePendingNotificationRequests(withIdentifiers: [identifier])
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

