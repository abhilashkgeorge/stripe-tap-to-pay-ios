//
//  AppDelegate.swift
//  Dabba Pay
//
//  Created by Abhilash Knox George on 13/05/24.
//

import UIKit
import StripeTerminal

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    static var apiURL: String? = "http://192.168.168.36:4567"
    static var apiClient: APIClient?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        guard let backendUrl = AppDelegate.apiURL else {
            fatalError("You must provide a backend URL to run this app.")
        }
        let apiClient = APIClient()
        apiClient.baseURLString = backendUrl
        Terminal.setTokenProvider(apiClient)
        Terminal.shared.delegate = TerminalDelegateAnnouncer.shared
        Terminal.shared.offlineDelegate = OfflineDelegateAnnouncer.shared
        AppDelegate.apiClient = apiClient
        
        Terminal.shared.logLevel = .verbose
        
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

