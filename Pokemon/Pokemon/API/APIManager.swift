//
//  APIManager.swift
//  Pokemon
//
//  Created by SinZih. XS Liou on 2024/10/31.
//

import Foundation
class APIManager {
    static let shared = APIManager()
    private let apiService: APIServiceProtocol
    
    private init(apiService: APIServiceProtocol =  APIService.shared) {
        self.apiService = apiService
    }
    
    func fetchPokemon(request: APIRequest) async throws -> Pokemon {
        return try await apiService.fetch(request: request)
    }
}
