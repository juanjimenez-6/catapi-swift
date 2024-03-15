//
//  CatAPI.swift
//  CatAPI
//
//  Created by J on 12/3/24.
//

import Foundation

enum CatAPI {
    case getRandomCat
    case getFavoriteCats
    case createFavoriteCat(imageId: String, subId: String)
    case deleteFavoriteCat(favouriteId: Int32)
    
    case searchImages(limit: Int, page: Int)
    case getBreeds
    
    var baseURL: URL {
        return URL(string: "https://api.thecatapi.com/v1")!
    }
    
    var path: String {
        switch self {
        case .getRandomCat:
            return "/images/search"
        case .getFavoriteCats:
            return "/favourites"
        case .createFavoriteCat:
            return "/favourites"
        case .deleteFavoriteCat(let favouriteId):
            return "/favourites/\(favouriteId)"
            
        case .searchImages:
            return "/images/search"
        case .getBreeds:
            return "/breeds"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getRandomCat, .getFavoriteCats, .searchImages, .getBreeds:
            return .get
        case .createFavoriteCat:
            return .post
        case .deleteFavoriteCat:
            return .delete
        }
    }
            
    
    var parameters: [String: String]? {
        switch self {
        case .searchImages(let limit, let page):
            return ["limit": "\(limit)", "page": "\(page)"]
        default:
            return nil
        }
    }
    
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
