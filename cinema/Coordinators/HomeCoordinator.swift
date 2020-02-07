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
    var root: UITabBarController
    
    init(window: UIWindow) {
        self.window = window
        self.root = UITabBarController()
        
        self.viewModel = UsersViewModel(delegateView: nil, service: UserService())
        self.viewModel.delegate = self
    }
    
    func start() {
        self.view = UsersViewController(viewModel: viewModel)
        navigation = UINavigationController(rootViewController: view!)
        if #available(iOS 13.0, *) {
            navigation?.tabBarItem = UITabBarItem(title: "Usuários", image: UIImage(systemName: "person.circle"), selectedImage: UIImage(systemName: "person.circle.fill"))
        } else {
            // Fallback on earlier versions
        }
        
        root.setViewControllers([navigation!], animated: false)
        window.rootViewController = root
    }
    
    func finish() {
        view = nil
        navigation = nil
    }
}

extension HomeCoordinator: UsersViewModelDelegate {
    func didSelectItem(_ viewModel: UsersViewModel, user: User) {
        print("selected user => \(user)")
        let vm = UserDetailsViewModel(user: user)
        let viewController = UserDetailsViewController(viewModel: vm)
        navigation?.pushViewController(viewController, animated: true)
    }
}
