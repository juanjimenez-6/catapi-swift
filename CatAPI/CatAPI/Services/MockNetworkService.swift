//
//  MockNetworkService.swift
//  CatAPI
//
//  Created by J on 12/3/24.
//

import Foundation

/// Mock network service for testing, allowing predefined results to be returned.
class MockNetworkService: NetworkServiceProtocol {
    var mockResult: Any?
    
    /// Mock request function to simulate network calls.
    /// - Parameters:
    ///   - endpoint: The endpoint being requested (not used in mock).
    ///   - completion: Completion handler with either mock result or error.
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
