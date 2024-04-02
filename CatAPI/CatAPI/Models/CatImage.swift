//
//  CatImage.swift
//  CatAPI
//
//  Created by J on 12/3/24.
//

/// While the Image object returned from the api contains more properties, only the id and url were requiered for our prototype
/// https://documenter.getpostman.com/view/5578104/RWgqUxxh#7fde7c73-8e64-49d7-a6ca-22132e3fc84c
struct CatImage: Decodable {
    let id: String
    let url: String
    
    enum CodingKeys: String, CodingKey {
        case id, url
    }
}

