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
    private var cancellables = Set<AnyCancellable>()
    
    func fetchPokemon(id: String) {
        let url = URL(string: "https://pokeapi.co/api/v2/pokemon/\(id)")!
        URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: Pokemon.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink { completion in
                if case .failure(let error) = completion {
                    print("Error: \(error)")
                }
            } receiveValue: { [weak self] pokemon in
                self?.pokemon = pokemon
            }
            .store(in: &cancellables)
    }
}
