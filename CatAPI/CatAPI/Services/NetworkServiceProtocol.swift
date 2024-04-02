//
//  NetworkServiceProtocol.swift
//  CatAPI
//
//  Created by J on 12/3/24.
//

import Foundation

/// Protocol for network service, allowing for real and mock implementations.
protocol NetworkServiceProtocol {
    func request<T: Decodable>(endpoint: CatAPI, completion: @escaping (Result<T, Error>) -> Void)
}

extension NetworkService: NetworkServiceProtocol {}
