//
//  CatAPI.swift
//  CatAPI
//
//  Created by J on 12/3/24.
//

import Foundation

/// Represents the various endpoints of The Cat API that this app interacts with.
enum CatAPI {
    // Cases for different API endpoints
    case getRandomCat
    case getFavoriteCats
    case createFavoriteCat(imageId: String, subId: String)
    case deleteFavoriteCat(favouriteId: Int32)
    case searchImages(limit: Int, page: Int)
    case getBreeds
    
    // Base URL of The Cat API
    var baseURL: URL {
        return URL(string: "https://api.thecatapi.com/v1")!
    }
    
    // Path for each endpoint
    var path: String {
        switch self {
        // Appends the specific path to the base URL for each API call
        case .getRandomCat: 
            return "/images/search"
        // Handles cases with and without additional parameters in the path
        case .deleteFavoriteCat(let favouriteId): 
            return "/favourites/\(favouriteId)"
        // For simplicity, other cases follow a similar pattern
        default: 
            return "/\(self)"
        }
    }
    
    // HTTP method for each endpoint
    var method: HTTPMethod {
        // Distinguishes between read-only (GET) and write (POST, DELETE) operations
        switch self {
        case .createFavoriteCat: 
            return .post
        case .deleteFavoriteCat: 
            return .delete
        default: 
            return .get
        }
    }
    
    // Parameters for endpoints that require them
    var parameters: [String: String]? {
        switch self {
        case .searchImages(let limit, let page): 
            return ["limit": "\(limit)", "page": "\(page)"]
        default:
            return nil
        }
    }
    
    // Body data for endpoints that require it, formatted as JSON
    var body: Data? {
        switch self {
        case .createFavoriteCat(let imageId, let subId):
            let bodyParameters = ["image_id": imageId, "sub_id": subId]
            return try? JSONSerialization.data(withJSONObject: bodyParameters, options: [])
        default: 
            return nil
        }
    }
}
