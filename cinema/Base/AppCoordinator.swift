//
//  AppCoordinator.swift
//  cinema
//
//  Created by Victor Martins Tinoco - VTN on 03/02/20.
//  Copyright © 2020 tinoco. All rights reserved.
//

import UIKit

class AppCoordinator: BaseCoordinator {
    var window: UIWindow
    var loginCoordinator: LoginCoordinator?
    var homeCoordinator: HomeCoordinator?
    
    init() {
        self.window = UIWindow()
        window.makeKeyAndVisible()
    }

    func start() {
        showLogin()
    }
    
    func finish() {
        
    }
    
    func showLogin() {
        loginCoordinator = loginCoordinator ?? LoginCoordinator(window: window)
        loginCoordinator?.delegate = self
        loginCoordinator!.start()
    }
    
    func showUsers() {
        homeCoordinator = homeCoordinator ?? HomeCoordinator(window: window)
        homeCoordinator!.start()
    }
}


extension AppCoordinator: LoginCoordinatorDelegate {
    func didSuccessLogin() {
        loginCoordinator?.finish()
        showUsers()
    }
}
