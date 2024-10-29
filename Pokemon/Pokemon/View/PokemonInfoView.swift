//
//  PokemonInfoView.swift
//  Pokemon
//
//  Created by SinZih. XS Liou on 2024/10/29.
//

import SwiftUI

struct PokemonInfoView: View {
    let pokemon: Pokemon
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Name: \(pokemon.name.capitalized)")
                .padding(.top, 12)
            Text("Height: \(Double(pokemon.height) / 10, specifier: "%.1f")m")
            Text("Weight: \(Double(pokemon.weight) / 10, specifier: "%.1f")kg")
            Text("ID: #\(String(format: "%03d", pokemon.id))")
            Spacer()
        }
        .font(.custom("Manrope", size: 16))
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.leading, 12)
        .background(Color(hex: "DEE1E6"))
        .cornerRadius(8)
    }
}

#Preview {
    PokemonInfoView(pokemon: .mock())
}
