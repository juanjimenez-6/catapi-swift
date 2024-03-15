//
//  CatImage.swift
//  CatAPI
//
//  Created by J on 12/3/24.
//

struct CatImage: Decodable {
    let id: String
    let url: String
    
    enum CodingKeys: String, CodingKey {
        case id, url
    }
}

