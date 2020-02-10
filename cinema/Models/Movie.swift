//
//  User.swift
//  cinema
//
//  Created by Victor Martins Tinoco - VTN on 05/02/20.
//  Copyright © 2020 tinoco. All rights reserved.
//

import Foundation

struct Movie: Codable {
    let id: Int
    let titulo: String
    let ano: Int
    let lancamento: String
    let duracao: String
    let genero: String
    let diretor: String
    let atores: String
    let sinopse: String
    let lingua: String
    let pais: String
    let premios: String
    let poster: String
    
    private enum CodingKeys: String, CodingKey {
        case id
        case titulo
        case ano
        case lancamento
        case duracao
        case genero
        case diretor
        case atores
        case sinopse
        case lingua
        case pais
        case premios
        case poster
    }
}

//extension Movie {
//    func asTuple() -> [(String, String)] {
//        return [
//            ("titulo", self.titulo),
//            ("id", self.id),
//            ("name", self.name),
//            ("idade", self.idade),
//            ("cpf", self.cpf),
//            ("endereco", self.endereco),
//            ("numero", self.numero),
//        ]
//    }
//}
