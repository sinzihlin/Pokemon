//
//  APIService.swift
//  Pokemon
//
//  Created by SinZih. XS Liou on 2024/10/30.
//

import Foundation
enum APIError: Error {
    case invalidURL
    case networkError(Error)
    case decodingError(Error)
}

protocol APIServiceProtocol {
    func fetch<T: Decodable>(request: APIRequest) async throws -> T
}

class APIService: APIServiceProtocol {
    static let shared = APIService()
    func fetch<T: Decodable>(request: APIRequest) async throws -> T {
        let urlRequest = try request.asURLRequest()
        
        do {
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                throw APIError.networkError(NSError(domain: "", code: -1))
            }
            
            return try JSONDecoder().decode(T.self, from: data)
        } catch let error as DecodingError {
            throw APIError.decodingError(error)
        } catch {
            throw APIError.networkError(error)
        }
    }
}
