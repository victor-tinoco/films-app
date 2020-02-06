//
//  LoginCoordinator.swift
//  cinema
//
//  Created by Victor Martins Tinoco - VTN on 03/02/20.
//  Copyright © 2020 tinoco. All rights reserved.
//

import UIKit

protocol LoginCoordinatorDelegate: class {
    func didSuccessLogin()
}

class LoginCoordinator: BaseCoordinator {
    var window: UIWindow
    let viewModel: LoginViewModel
    var view: UIViewController?
    var navigation: UINavigationController?
    
    weak var delegate: LoginCoordinatorDelegate?
    
    init(window: UIWindow) {
        self.window = window
        self.viewModel = LoginViewModel()
        self.viewModel.delegate = self
    }
    
    func start() {
        self.view = LoginViewController(viewModel: viewModel)
        navigation = UINavigationController(rootViewController: view!)
        navigation?.setNavigationBarHidden(true, animated: true)
        window.rootViewController = navigation
    }
    
    func finish() {
        view = nil
        navigation = nil
    }
}

extension LoginCoordinator: LoginViewModelDelegate {
    func didSuccessLogin(_ viewModel: LoginViewModel) {
        delegate?.didSuccessLogin()
    }
}
