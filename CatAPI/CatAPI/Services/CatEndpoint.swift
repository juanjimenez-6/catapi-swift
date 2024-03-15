//
//  CatEndpoint.swift
//  CatAI
//
//  Created by J on 12/3/24.
//

import Foundation

enum CatEndpoint: APIEndpoint {
    case getRandomCat
    
    var baseURL: URL {
        return URL(string: "https://api.thecatapi.com/v1")!
    }
    
    var path: String {
        switch self {
        case .getRandomCat:
            return "/images/search"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getRandomCat:
            return .get
        }
    }
    
    var headers: [String: String]? {
        switch self {
        case .getRandomCat:
            return ["x-api-key": "live_UEOvpeIIRe8IHrUDObRBspbDXLlQ0KvhKP6FXq5JXD0lyEzOXfX471WEX4aTPz8m"]
        }
    }
    
    var parameters: [String: Any]? {
        switch self {
        case .getRandomCat:
            return ["api_key": "live_UEOvpeIIRe8IHrUDObRBspbDXLlQ0KvhKP6FXq5JXD0lyEzOXfX471WEX4aTPz8m"]
        }
    }
}
