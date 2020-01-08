//
//  AppDelegate.swift
//  StackViewAutoLayoutTest
//
//  Created by TechFun on 11/22/19.
//  Copyright © 2019 MyintZu. All rights reserved.
//

import UIKit
import CoreLocation
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

   let barButtonApperance = UIBarButtonItem.appearance()
    let center = UNUserNotificationCenter.current()
    let locationManager = CLLocationManager()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let backButton = UIImage(named: "back")
        let backButtonImage = backButton?.stretchableImage(withLeftCapWidth: 0, topCapHeight: 10)
        barButtonApperance.setBackButtonBackgroundImage(backButtonImage, for: .normal, barMetrics: .default)
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

