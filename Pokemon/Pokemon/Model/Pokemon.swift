//
//  MonsterModel.swift
//  Pokemon
//
//  Created by SinZih. XS Liou on 2024/10/15.
//

import Foundation
struct Pokemon: Codable, Identifiable {
    let id: Int
    let name: String
    let height: Int
    let weight: Int
    let types: [PokemonType]
    let sprites: Sprites
    ///假資料測試
    static func mock() -> Pokemon {
        let types : [PokemonType] = [
            .init(slot: UUID().hashValue, type: .init(name: "electric", url: "")),
            .init(slot: UUID().hashValue, type: .init(name: "fire", url: "")),
            .init(slot: UUID().hashValue, type: .init(name: "water", url: ""))]
        
        return Pokemon(id: 1, name: "Pikachu", height: 4, weight: 60, types: types, sprites: .init(other: .init(home: .init(frontDefault: "https://example.com/pikachu.png"))))
       
    }
}
struct PokemonType: Codable {
    let slot: Int
    let type: TypeInfo
}

struct TypeInfo: Codable {
    let name: String
    let url: String
}

struct Sprites: Codable {
    let other: OtherSprites
}

struct OtherSprites: Codable {
    let home: HomeSprites
}

struct HomeSprites: Codable {
    let frontDefault: String
    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
    }
}
