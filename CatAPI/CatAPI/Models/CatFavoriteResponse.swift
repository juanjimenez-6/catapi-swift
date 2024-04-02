//
//  CatFavoriteResponse.swift
//  CatAPI
//
//  Created by J on 12/3/24.
//

/// Response object as described on https://documenter.getpostman.com/view/5578104/RWgqUxxh#682feca6-99cc-46d9-b5b1-28eaa9b11a5b
struct CatFavoriteResponse: Decodable {
    let message: String
    let id: Int32
}
