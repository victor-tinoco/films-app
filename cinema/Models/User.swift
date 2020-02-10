//
//  User.swift
//  cinema
//
//  Created by Victor Martins Tinoco - VTN on 05/02/20.
//  Copyright © 2020 tinoco. All rights reserved.
//

import Foundation

struct User: Codable {
    let id: Int
    let titulo: String
    let nome: String
    let idade: Int
    let cpf: String
    let endereco: String
    let numero: Int
    let cep: String
    let complemento: String
    
    private enum CodingKeys: String, CodingKey {
        case id
        case titulo
        case nome
        case idade
        case cpf
        case endereco
        case numero
        case cep
        case complemento
    }
}

extension User {
    func asTuple() -> [(String, String)] {
        return [
            ("Nome", self.nome ),
            ("Idade", String(self.idade) ),
            ("CPF", self.cpf ),
            ("Endereço", self.endereco ),
            ("Número", String(self.numero) ),
            ("CEP", self.cep ),
            ("Complemento", self.complemento ),
        ]
    }
}
