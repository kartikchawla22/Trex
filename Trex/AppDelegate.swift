//
//  AppDelegate.swift
//  Kartik_Chawla_MidTerm
//
//  Created by Kartik Chawla on 2022-10-05.
//

import FirebaseCore
import FirebaseFirestore
import Foundation
import SwiftUI

// AppDelegate.swift

// MARK: - App Delegate

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        UNUserNotificationCenter.current().delegate = self
        FirebaseApp.configure()
        _ = Firestore.firestore()
        return true
    }
}

// MARK: - App Delegate Extention

extension AppDelegate: UNUserNotificationCenterDelegate {
    // MARK: - Notification Will Present

    /// This Method is used to get notifications in Foreground mode.
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        print("Notification received with identifier \(notification.request.identifier)")
        // So we call the completionHandler telling that the notification should display a banner and play a sound
        completionHandler([.banner, .sound])
    }

    // MARK: - Notification Did Recieve

    /// This Method is used to get Notifications in Background mode.
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        print("Notification received")
        // So we call the completionHandler telling that the notification should display a banner and play a sound
        completionHandler([.banner, .sound])
    }
}
