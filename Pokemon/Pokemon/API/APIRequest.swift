//
//  APIRequest.swift
//  Pokemon
//
//  Created by SinZih. XS Liou on 2024/10/30.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

protocol APIRequest {
    var baseURL: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var headers: [String: String]? { get }
    var body: Data? { get }
    
    func asURLRequest() throws -> URLRequest
}

extension APIRequest {
    var baseURL: String {
        "https://pokeapi.co/api/v2"
    }
    
    var headers: [String: String]? {
        ["Content-Type": "application/json"]
    }
    
    var body: Data? {
        nil
    }
    
    func asURLRequest() throws -> URLRequest {
        guard let url = URL(string: baseURL + path) else {
            throw APIError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        
        headers?.forEach { key, value in
            request.setValue(value, forHTTPHeaderField: key)
        }
        
        request.httpBody = body
        return request
    }
}
