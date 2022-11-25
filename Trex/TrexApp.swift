//
//  TrexApp.swift
//  Trex
//
//  Created by Kartik Chawla on 2022-10-27.
//

import SwiftUI

@main
struct TrexApp: App {
    // MARK: -  Application Delegate Adaptor
    
    // Using Application Delegate Adaptor to initiate AppDelete in SwiftUI Project.
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    // MARK: - init
    
    // init will be called when this struct is initialized.
    init() {
        // Calling requestAuthFromUser from NotificationsManager to check if user has given application the permissions or not when app is launched.
        NotificationsManager.requestAuthFromUser()
        NotificationsManager.cancelAllPendingNotifications()
        NotificationsManager.generateNotification(title: "Good Morning.", description: "Good Day to complete your gaily goals!", hour: 8)
        NotificationsManager.generateNotification(title: "What a noon!", description: "Good Going! Happy Walking!", hour: 12)
        NotificationsManager.generateNotification(title: "Evening!", description: "More Walk, Less Talk!", hour: 16)
        NotificationsManager.generateNotification(title: "What a day!", description: "Checkout your daily goal.", hour: 20)
    }
    
    var body: some Scene {
        WindowGroup {
            SplashScreenView()
        }
    }
}
