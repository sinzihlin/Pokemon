//
//  PokemonRequest.swift
//  Pokemon
//
//  Created by SinZih. XS Liou on 2024/10/30.
//

import Foundation
struct PokemonRequest: APIRequest {
    let pokemonId: String
    
    var method: HTTPMethod {
        .get
    }
    
    var path: String {
        "/pokemon/\(pokemonId)"
    }
    
}
