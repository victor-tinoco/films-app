//
//  UsersService.swift
//  cinema
//
//  Created by Victor Martins Tinoco - VTN on 05/02/20.
//  Copyright © 2020 tinoco. All rights reserved.
//

import Foundation
import Alamofire

protocol MovieServiceContract {
    func get(id: Int, completionHandler: @escaping (Result<Movie,MovieServiceError>) -> Void)
    func list(completionHandler: @escaping (Result<[Movie],MovieServiceError>) -> Void)
}

enum MovieServiceError: Error {
    case error
}

class MovieService: MovieServiceContract {
    let baseUrl: URL = K.baseUrl
    
    func list(completionHandler: @escaping (Result<[Movie], MovieServiceError>) -> Void) {
        AF.request(URL(string: "/filme", relativeTo: baseUrl)!).response { (res) in
            print(res)
            
            guard let data = res.data, let list = try? JSONDecoder().decode([Movie].self, from: data) else {
                completionHandler(Result.failure(MovieServiceError.error))
                return
            }
            
            completionHandler(Result.success(list))
            return
        }
    }
    
    func get(id: Int, completionHandler: @escaping (Result<Movie,MovieServiceError>) -> Void) {
        AF.request(URL(string: "/filme/\(id)", relativeTo: baseUrl)!).response { (res) in
            guard let data = res.data, let movie = try? JSONDecoder().decode(Movie.self, from: data) else {
                completionHandler(Result.failure(MovieServiceError.error))
                return
            }
            
            completionHandler(Result.success(movie))
            return
        }
    }
    
//    TENTATIVA DE FAZER MÉTODO POST
//    func post(user: User, completionHandler: @escaping (Any?) -> Void) {
//        AF.request(URL(string: "/usuario/", relativeTo: baseUrl)!, parameters: user, encoder: URLEncodedFormParameterEncoder.default).response { (res) in
//
//            print(res)
//        }
//    }
}
