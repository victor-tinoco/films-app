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

extension Movie {
    func asTuple() -> [(String, String)] {
        return [
            ("Título", self.titulo),
            ("Ano", String(self.ano)),
            ("Lançamento", self.lancamento),
            ("Duração", self.duracao),
            ("Gênero", self.genero),
            ("Diretor", self.diretor),
            ("Atores", self.atores),
            ("Sinopse", self.sinopse),
            ("Língua", self.lingua),
            ("País", self.pais),
            ("Prêmios", self.premios),
        ]
    }
}
