//
//  PokemonTypeView.swift
//  Pokemon
//
//  Created by SinZih. XS Liou on 2024/10/29.
//

import SwiftUI

struct PokemonTypeView: View {
    let title: String = "Type"
    let pokemon: Pokemon
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                .foregroundColor(.black)
                .fontWeight(.medium)
                .padding(.top, 12)
            ForEach(pokemon.types, id: \.slot) { type in
                            Text(type.type.name.capitalized)
                                .padding(.vertical, 3)
                                .frame(maxWidth: .infinity, alignment: .center)
                                .background(Color(hex: "DEE1E6"))
                                .cornerRadius(18)
                                .padding(.trailing, 12)
                        }
            Spacer()
        }
        .font(.custom("Manrope", size: 16))
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.leading, 12)
    }
}

#Preview {
    PokemonTypeView(pokemon: .mock())
}
