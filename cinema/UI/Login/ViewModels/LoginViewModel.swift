//
//  LoginViewModel.swift
//  cinema
//
//  Created by Victor Martins Tinoco - VTN on 03/02/20.
//  Copyright © 2020 tinoco. All rights reserved.
//

import Foundation

protocol LoginViewModelContract {
    func makeLogin(user: String, password: String)
}

protocol LoginViewModelViewDelegate: class {
    func didErrorLogin()
}

protocol LoginViewModelDelegate: class {
    func didSuccessLogin(_ viewModel: LoginViewModel)
}

class LoginViewModel: LoginViewModelContract {

//  MARK: - Delegates
    weak var delegateView: LoginViewModelViewDelegate?
    weak var delegate: LoginViewModelDelegate?
    
//  MARK: - Methods
    func makeLogin(user: String, password: String) {
        if user == "Grupo5", password == "123" {
            delegate?.didSuccessLogin(self)
        } else {
            delegateView?.didErrorLogin()
        }
    }
}
