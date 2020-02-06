//
//  UsersService.swift
//  cinema
//
//  Created by Victor Martins Tinoco - VTN on 05/02/20.
//  Copyright © 2020 tinoco. All rights reserved.
//

import Foundation
import Alamofire

protocol UserServiceContract {
    func get(id: Int, completionHandler: @escaping (Result<User,UserServiceError>) -> Void)
    func list(completionHandler: @escaping (Result<[User],UserServiceError>) -> Void)
}

enum UserServiceError: Error {
    case error
}

class UserService: UserServiceContract {
    let baseUrl: URL = K.baseUrl
    
    func list(completionHandler: @escaping (Result<[User],UserServiceError>) -> Void) {
        AF.request(URL(string: "/usuario", relativeTo: baseUrl)!).response { (res) in
            guard let data = res.data, let list = try? JSONDecoder().decode([User].self, from: data) else {
                completionHandler(Result.failure(UserServiceError.error))
                return
            }
            
            completionHandler(Result.success(list))
            return
        }
    }
    
    func get(id: Int, completionHandler: @escaping (Result<User,UserServiceError>) -> Void) {
        AF.request(URL(string: "/usuario/\(id)", relativeTo: baseUrl)!).response { (res) in
            guard let data = res.data, let user = try? JSONDecoder().decode(User.self, from: data) else {
                completionHandler(Result.failure(UserServiceError.error))
                return
            }
            
            completionHandler(Result.success(user))
            return

        }
    }
}
