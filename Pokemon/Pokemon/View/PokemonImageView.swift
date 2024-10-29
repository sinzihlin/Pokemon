//
//  PokemonImageView.swift
//  Pokemon
//
//  Created by SinZih. XS Liou on 2024/10/29.
//

import SwiftUI

struct PokemonImageView: View {
    let pokemon: Pokemon
    var body: some View {
        AsyncImage(url: URL(string: pokemon.sprites.other.home.frontDefault)) { image in
            image.resizable()
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .overlay {
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color(hex: "DEE1E6"), lineWidth: 5)
                }
                .padding(.horizontal, 12)
        } placeholder: {
            ProgressView()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .overlay {
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color(hex: "DEE1E6"), lineWidth: 2)
                }
                .padding(.horizontal, 12)
        }
    }
}
#Preview {
    PokemonImageView(pokemon: .mock())
}
