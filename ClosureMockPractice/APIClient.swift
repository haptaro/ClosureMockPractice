//
//  APIClient.swift
//  ClosureMockPractice
//
//  Created by Kotaro Fukuo on 2022/07/17.
//

import Foundation

struct APIClient {
    var send: () async throws -> String
}

enum APIClientError: Error {
    case unknown
}

extension APIClient {
    // Use: http://api.weatherapi.com/v1/current.json
    static var live = APIClient(send: {
        let urlString = "http://api.weatherapi.com/v1/current.json"
        do {
            let (data, response) = try await URLSession.shared.data(from: URL(string: urlString)!)
            let body = try JSONDecoder().decode(Body.self, from: data)
            return body.current.condition.text
        } catch {
            throw error
        }
    })
    
    static var failure = APIClient(send: {
        throw APIClientError.unknown
    })
    
    static var success = APIClient(send: {
        return "Sunny"
    })
}

struct Body: Decodable {
    var current: Current
    
    enum CodingKeys: String, CodingKey {
        case current = "current"
    }
}


struct Current: Decodable {
    var condition: Condition
    
    enum CodingKeys: String, CodingKey {
        case condition = "condition"
    }
}

struct Condition: Decodable {
    var text: String
    
    enum CodingKeys: String, CodingKey {
        case text = "text"
    }
}
