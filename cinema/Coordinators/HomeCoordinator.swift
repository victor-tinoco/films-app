//
//  HomeCoordinator.swift
//  cinema
//
//  Created by Victor Martins Tinoco - VTN on 05/02/20.
//  Copyright © 2020 tinoco. All rights reserved.
//

import UIKit

class HomeCoordinator: BaseCoordinator {
    
    var window: UIWindow
    let viewModel: UsersViewModel
    var view: UIViewController?
    var navigation: UINavigationController?
    
    init(window: UIWindow) {
        self.window = window
        self.viewModel = UsersViewModel(delegate: nil, service: UserService())
    }
    
    func start() {
        self.view = UsersViewController(viewModel: viewModel)
        navigation = UINavigationController(rootViewController: view!)
        window.rootViewController = navigation
    }
    
    func finish() {
        view = nil
        navigation = nil
    }
}
