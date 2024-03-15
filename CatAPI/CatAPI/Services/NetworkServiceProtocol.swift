//
//  NetworkServiceProtocol.swift
//  CatAPI
//
//  Created by J on 12/3/24.
//

import Foundation

protocol NetworkServiceProtocol {
    func request<T: Decodable>(endpoint: CatAPI, completion: @escaping (Result<T, Error>) -> Void)
}

extension NetworkService: NetworkServiceProtocol {}
