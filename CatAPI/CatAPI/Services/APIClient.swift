//
//  APIClient.swift
//  CatAI
//
//  Created by J on 12/3/24.
//

import Combine

protocol APIClient {
    associatedtype EndpointType: APIEndpoint
    func request<T: Decodable>(_ endpoint: EndpointType) -> AnyPublisher<T, Error>
}
