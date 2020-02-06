//
//  AppDelegate.swift
//  cinema
//
//  Created by Victor Martins Tinoco - VTN on 03/02/20.
//  Copyright © 2020 tinoco. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var appCoordinator: AppCoordinator!
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        appCoordinator = AppCoordinator()
        appCoordinator.start()
        
        return true
    }
}

