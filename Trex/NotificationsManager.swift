//
//  NotificationsManager.swift
//  Kartik_Chawla_MidTerm
//
//  Created by Kartik Chawla on 2022-10-05.
//

import Foundation
import NotificationCenter

// MARK: - Notificaitons Manager Class

class NotificationsManager {
    // MARK: - Static Functions
    
    /// This function is used to generate notifications using a title and description
    static func generateNotification(title: String, description: String, hour: Int) {
        // Creating Mutable notifications content to add title and description.
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = description
        content.sound = .default
        generateNotificationAtSpecificTimeOfTheDay(content: content, hour: hour)
    }
    
    /// Function to get user permissions for notification.
    static func requestAuthFromUser() {
        // Instantiating notification Center.
        let notificationCenter = UNUserNotificationCenter.current()
        
        // Requesting the user for notifications access.
        notificationCenter.requestAuthorization(options: [.alert, .sound, .badge]) {
            granted, error in
            
            // Checking if there is an error or not.
            guard error == nil else {
                // If there is an error this message will print and exit the code.
                print("There is an Error \(String(describing: error))")
                return
            }
            // If there is no error then this message will print.
            print(granted)
        }
    }

    private static func generateNotificationAtSpecificTimeOfTheDay(content: UNNotificationContent, hour: Int) {
        var dateInfo = DateComponents()
        let dateComponents = Calendar.current
        
        dateInfo.day = dateComponents.component(.day, from: Date())
        dateInfo.month = dateComponents.component(.month, from: Date())
        dateInfo.year = dateComponents.component(.year, from: Date())
        dateInfo.hour = hour
        dateInfo.minute = 0
        let localNotificationTrigger = UNCalendarNotificationTrigger(dateMatching: dateInfo, repeats: true)
        
        // getting the Universal Unique Identifier
        let uuid = UUID().uuidString
        
        // Creating a Request for Notifications
        let request = UNNotificationRequest(identifier: uuid, content: content, trigger: localNotificationTrigger)
        
        // Instantiating notification Center to add notifications requests.
        let notificationCenter = UNUserNotificationCenter.current()
        
        // Adding a notification Request to the notification center
        notificationCenter.add(request) {
            error in
            
            // Checking if there is an error or not.
            guard error == nil else {
                // If there is an error this message will print and exit the code.
                print("There is an Error \(String(describing: error))")
                return
            }
            // If there is no error then this message will print.
            print("Notification Generated Successfully")
        }
    }

    static func cancelAllPendingNotifications() {
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
    }
}
