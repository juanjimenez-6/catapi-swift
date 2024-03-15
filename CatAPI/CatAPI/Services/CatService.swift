//
//  CatService.swift
//  CatAI
//
//  Created by J on 12/3/24.
//

import Foundation
import Combine

class CatService: CatServiceProtocol {
    let apiClient = URLSessionAPIClient<CatEndpoint>()
    
    func getRandomCat() -> AnyPublisher<[Cat], Error> {
        return apiClient.request(.getRandomCat)
    }
}
