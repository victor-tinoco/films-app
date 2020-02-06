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
}

protocol UsersViewModelViewDelegate: class {
    func didFinishRegister()
    func didUpdateUsersList()
    func didCompleteWithError(_ message: String)
}

class UsersViewModel: UsersViewModelContract {
    private var usersList: [User] = []
    
    var users: [User] {
        return usersList
    }

//  MARK: - Variables
    var service: UserService?
    
//  MARK: - Delegates
    weak var delegate: UsersViewModelViewDelegate?
    
//  MARK: - Methods
    init(delegate: UsersViewModelViewDelegate?, service: UserService?) {
        self.delegate = delegate
        self.service = service ?? UserService()
    }
    
    func set(delegate: UsersViewModelViewDelegate?) {
        self.delegate = delegate
    }
    
    func fetchUsers() {
        service?.list(completionHandler: { (result) in
            guard let list = try? result.get() else {
                self.delegate?.didCompleteWithError("Ocorreu um erro ao recuperar a lista de usuários")
                return
            }
            
            self.usersList.removeAll()
            self.usersList.append(contentsOf: list)
            self.delegate?.didUpdateUsersList()
        })
    }
}
