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
        // Cancelling all the previous pending notifications.
        NotificationsManager.cancelAllPendingNotifications()
        // This notification will trigger everyday at 8:00AM
        NotificationsManager.generateNotification(title: "Good Morning.", description: "Good Day to complete your gaily goals!", hour: 8)
        // This notification will trigger everyday at 12:00 Noon
        NotificationsManager.generateNotification(title: "What a noon!", description: "Good Going! Happy Walking!", hour: 12)
        // This notification will trigger everyday at 4:00PM
        NotificationsManager.generateNotification(title: "Evening!", description: "More Walk, Less Talk!", hour: 16)
        // This notification will trigger everyday at 8:00PM
        NotificationsManager.generateNotification(title: "What a day!", description: "Checkout your daily goal.", hour: 20)
    }
    
    var body: some Scene {
        WindowGroup {
            SplashScreenView()
        }
    }
}
