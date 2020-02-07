//
//  UserDetailsViewModel.swift
//  cinema
//
//  Created by Victor Martins Tinoco - VTN on 07/02/20.
//  Copyright © 2020 tinoco. All rights reserved.
//

import Foundation
import UIKit

protocol UserDetailsViewModelContract {
    var user: User { get }
    var properties: [(String,String)] { get }
}

class UserDetailsViewModel: UserDetailsViewModelContract {
    private var selectedUser: User!
    
    var properties: [(String,String)] {
        return selectedUser?.asTuple() ?? []
    }
    
    var user: User {
        return selectedUser
    }
    
    init(user: User) {
        self.selectedUser = user
    }
}
