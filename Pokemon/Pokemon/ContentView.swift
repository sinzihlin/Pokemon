//
//  ContentView.swift
//  Pokemon
//
//  Created by SinZih. XS Liou on 2024/10/15.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = PokemonViewModel()

    var body: some View {
        VStack {
            let _ = Self._printChanges()
            if let pokemon = viewModel.pokemon {
                            PokemonImageView(pokemon: pokemon)
                            PokemonDetailsView(pokemon: pokemon)
                        } else {
                            ProgressView()
                        }
        }
        .onAppear {
            viewModel.fetchPokemon(id: "pikachu")
        }}
}
#Preview {
    ContentView()
}

