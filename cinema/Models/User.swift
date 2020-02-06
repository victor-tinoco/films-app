//
//  User.swift
//  cinema
//
//  Created by Victor Martins Tinoco - VTN on 05/02/20.
//  Copyright © 2020 tinoco. All rights reserved.
//

import Foundation

struct User: Codable {
    let titulo: String
    let id: String
    let name: String
    let idade: String
    let cpf: String
    let endereco: String
    let numero: String
//    let complemento: String
    
    private enum CodingKeys: String, CodingKey {
        case titulo
        case id
        case name
        case idade
        case cpf = "CPF"
        case endereco
        case numero
//        case complemento
    }
}
