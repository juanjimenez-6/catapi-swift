//
//  EmptyResponse.swift
//  CatAPI
//
//  Created by J on 13/3/24.
//

import Foundation

/// Certain requests like the Favorite Deletion do not really return anything other than a string message describing the success of the request
/// https://documenter.getpostman.com/view/5578104/RWgqUxxh#3e0cd5a2-e33e-4e38-b754-e60ff62bdc7d
struct EmptyResponse: Decodable {
    let message: String
}
