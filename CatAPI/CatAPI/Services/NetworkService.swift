//
//  NetworkService.swift
//  CatAPI
//
//  Created by J on 12/3/24.
//

import Foundation

class NetworkService {
    static let shared = NetworkService()
    private init() {}
    
    func request<T: Decodable>(endpoint: CatAPI, completion: @escaping (Result<T, Error>) -> Void) {
        var components = URLComponents(url: endpoint.baseURL.appendingPathComponent(endpoint.path), resolvingAgainstBaseURL: false)!
        components.queryItems = endpoint.parameters?.map { URLQueryItem(name: $0.key, value: $0.value) }
        
        var request = URLRequest(url: components.url!)
        request.httpMethod = endpoint.method.rawValue
        request.addValue("live_UEOvpeIIRe8IHrUDObRBspbDXLlQ0KvhKP6FXq5JXD0lyEzOXfX471WEX4aTPz8m", forHTTPHeaderField: "x-api-key")
        
        if let body = endpoint.body, [.post, .put].contains(endpoint.method) {
            request.httpBody = body
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        }
                    
        URLSession.shared.dataTask(with: request) { data, response, error in
            print(String(data: data!, encoding: .utf8)!)
            DispatchQueue.main.async {
                guard let data = data, error == nil else {
                    completion(.failure(error!))
                    return
                }
                
                do {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    
                    let decodedResponse = try decoder.decode(T.self, from: data)
                    completion(.success(decodedResponse))
                } catch {
                    print("Decoding failed: \(error)")
                    completion(.failure(error))
                }
            }
        }.resume()
    }
}
