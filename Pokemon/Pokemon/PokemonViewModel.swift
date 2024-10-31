//
//  PokemonViewModel.swift
//  Pokemon
//
//  Created by SinZih. XS Liou on 2024/10/16.
//

import Foundation
import Combine

class PokemonViewModel: ObservableObject {
    @Published var pokemon: Pokemon?
    @Published var error: Error?
    
    private var cancellables = Set<AnyCancellable>()
    
    func fetchPokemon(name: String) {
        Task {
            do {
                print("1")
                let request = PokemonRequest(pokemonId: name)
                let pokemon = try await APIManager.shared.fetchPokemon(request: request)
                await MainActor.run { [weak self] in
                    self?.pokemon = pokemon
                }
                print("3")
            }catch {
                self.error = error
                print("Error\(error)")
            }
        }
    }
}
