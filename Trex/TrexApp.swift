//
//  TrexApp.swift
//  Trex
//
//  Created by Kartik Chawla on 2022-10-27.
//

import SwiftUI


@main
struct TrexApp: App {
    //MARK: -  Application Delegate Adaptor
    
    // Using Application Delegate Adaptor to initiate AppDelete in SwiftUI Project.
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    //MARK: - init
    
    // init will be called when this struct is initialized.
    init() {
        // Calling requestAuthFromUser from NotificationsManager to check if user has given application the permissions or not when app is launched.
        NotificationsManager.requestAuthFromUser()
        NotificationsManager.generateNotification(title: "This is notification", description: "This is morning 8 am notification")
    }
    
    
    
    var body: some Scene {
        WindowGroup {
           let viewModel = AppviewModel()
            LoginView()
             .environmentObject(viewModel)
            
        }
    }
}
