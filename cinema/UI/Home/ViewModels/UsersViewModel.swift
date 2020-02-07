//
//  UserViewModel.swift
//  cinema
//
//  Created by Victor Martins Tinoco - VTN on 04/02/20.
//  Copyright © 2020 tinoco. All rights reserved.
//

import Foundation

protocol UsersViewModelContract {
    var users: [User] { get }
    func fetchUsers()
    func set(delegate: UsersViewModelViewDelegate?)
    func showUserDetails(_ index: IndexPath)
}

protocol UsersViewModelViewDelegate: class {
    func didFinishRegister()
    func didUpdateUsersList()
    func didCompleteWithError(_ message: String)
}

protocol UsersViewModelDelegate: class {
    func didSelectItem(_ viewModel: UsersViewModel, user: User)
}

class UsersViewModel: UsersViewModelContract {
    private var usersList: [User] = []
    
    var users: [User] {
        return usersList
    }

//  MARK: - Variables
    var service: UserService?
    
//  MARK: - Delegates
    weak var delegateView: UsersViewModelViewDelegate?
    weak var delegate: UsersViewModelDelegate?
    
//  MARK: - Methods
    init(delegateView: UsersViewModelViewDelegate?, service: UserService?) {
        self.delegateView = delegateView
        self.service = service ?? UserService()
    }
    
    func set(delegate: UsersViewModelViewDelegate?) {
        self.delegateView = delegate
    }
    
    func fetchUsers() {
        service?.list(completionHandler: { (result) in
            guard let list = try? result.get() else {
                self.delegateView?.didCompleteWithError("Ocorreu um erro ao recuperar a lista de usuários")
                return
            }
            
            self.usersList.removeAll()
            self.usersList.append(contentsOf: list)
            self.delegateView?.didUpdateUsersList()
        })
    }
    
    func showUserDetails(_ index: IndexPath) {
        let user: User = users[index.row]
        delegate?.didSelectItem(self, user: user)
    }
}
