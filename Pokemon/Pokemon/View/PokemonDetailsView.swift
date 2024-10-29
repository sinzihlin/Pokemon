//
//  PokemonDetailsView.swift
//  Pokemon
//
//  Created by SinZih. XS Liou on 2024/10/29.
//

import SwiftUI

struct PokemonDetailsView: View {
    let pokemon: Pokemon
    var body: some View {
        HStack {
            PokemonInfoView(pokemon: pokemon)
            PokemonTypeView(pokemon: pokemon)
        }
        .padding(.horizontal, 12)
    }
}

#Preview {
    PokemonDetailsView(pokemon: .mock())
}
