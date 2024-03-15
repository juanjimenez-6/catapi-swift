//
//  MockNetworkService.swift
//  CatAPI
//
//  Created by J on 12/3/24.
//

import Foundation

class MockNetworkService: NetworkServiceProtocol {
    var mockResult: Any?
    
    func request<T: Decodable>(endpoint: CatAPI, completion: @escaping (Result<T, Error>) -> Void) {
        if let mockResult = mockResult as? T {
            completion(.success(mockResult))
        } else if let mockError = mockResult as? Error {
            completion(.failure(mockError))
        } else {
            fatalError("Mock result not set or is set to an incompatible type.")
        }
    }
}
