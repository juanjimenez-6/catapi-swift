//
//  CatFavoriteListViewModel.swift
//  CatAPI
//
//  Created by J on 13/3/24.
//

import Foundation

class CatFavoriteListViewModel: ObservableObject {
    @Published var favorites:  [CatFavorite] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    @Published var success: Bool = false
    @Published var error: Bool = false
    @Published var favoriteToDelete: Int32?
    @Published var showConfirmDialog: Bool = false
    
    private var networkService: NetworkServiceProtocol

    init(networkService: NetworkServiceProtocol = NetworkService.shared) {
        self.networkService = networkService
    }

    func fetchFavoriteCats() {
        isLoading = true
        networkService.request(endpoint: .getFavoriteCats) { [weak self] (result: Result<[CatFavorite], Error>) in
            guard let self = self else { return }
            self.isLoading = false
            switch result {
            case .success(let images):
                self.favorites = images
                self.success = true
                self.error = false
            case .failure(let error):
                self.errorMessage = error.localizedDescription
                self.success = false
                self.error = true
            }
        }
    }
    
    func deleteFavorite(forFavoriteId favoriteId: Int32, completion: @escaping (Result<EmptyResponse, Error>) -> Void) {
        networkService.request(endpoint: .deleteFavoriteCat(favouriteId: favoriteId)) { (result: Result<EmptyResponse, Error>) in
            switch result {
            case .success(let response):
                self.success = true
                self.error = false
                completion(.success(response))
            case .failure(let error):
                self.success = false
                self.error = true
                completion(.failure(error))
            }
        }
    }
}
