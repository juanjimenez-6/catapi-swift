//
//  NetworkService.swift
//  CatAPI
//
//  Created by J on 12/3/24.
//

import Foundation

/// Provides network services for interacting with The Cat API.
class NetworkService {
    // Singleton instance for network service
    static let shared = NetworkService()
    private init() {}
    
    /// Performs network request to The Cat API based on the given endpoint and decodes the response.
    /// - Parameters:
    ///   - endpoint: The Cat API endpoint to request.
    ///   - completion: Completion handler with result (success/failure).
    func request<T: Decodable>(endpoint: CatAPI, completion: @escaping (Result<T, Error>) -> Void) {
        var components = URLComponents(url: endpoint.baseURL.appendingPathComponent(endpoint.path), resolvingAgainstBaseURL: false)!
        components.queryItems = endpoint.parameters?.map { URLQueryItem(name: $0.key, value: $0.value) }
        
        // Construct the full URL and configure the request
        var request = URLRequest(url: components.url!)
        request.httpMethod = endpoint.method.rawValue
        // API key header
        request.addValue("live_UEOvpeIIRe8IHrUDObRBspbDXLlQ0KvhKP6FXq5JXD0lyEzOXfX471WEX4aTPz8m", forHTTPHeaderField: "x-api-key")
        
        // Adds JSON body if required, currently for POST or PUT requests
        if let body = endpoint.body, [.post, .put].contains(endpoint.method) {
            request.httpBody = body
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        }
                    
        // Perform the request
        URLSession.shared.dataTask(with: request) { data, response, error in
            print(String(data: data!, encoding: .utf8)!)
            // Async handling back on the main thread
            DispatchQueue.main.async {
                guard let data = data, error == nil else {
                    completion(.failure(error!))
                    return
                }
                
                // Attempt to decode the response
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
