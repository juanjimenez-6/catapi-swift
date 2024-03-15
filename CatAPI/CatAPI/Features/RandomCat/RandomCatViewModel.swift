//
//  RandomCatViewModel.swift
//  CatAPI
//
//  Created by J on 12/3/24.
//

import Foundation
import Combine

class RandomCatViewModel: ObservableObject {
    @Published var catImage: CatImage?
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    @Published var success: Bool = false
    @Published var error: Bool = false
    @Published var favorite: CatFavoriteResponse?
    
    private var networkService: NetworkServiceProtocol

    init(networkService: NetworkServiceProtocol = NetworkService.shared) {
        self.networkService = networkService
    }

    func fetchRandomCatImage() {
        isLoading = true
        catImage = nil
        networkService.request(endpoint: .getRandomCat) { [weak self] (result: Result<[CatImage], Error>) in
            guard let self = self else { return }
            self.isLoading = false
            switch result {
            case .success(let images):
                self.catImage = images[0]
                self.success = true
                self.error = false
            case .failure(let error):
                self.errorMessage = error.localizedDescription
                self.success = false
                self.error = true
            }
        }
    }
    
    func createFavorite(forImageId imageId: String, subId: String) {
        networkService.request(endpoint: .createFavoriteCat(imageId: imageId, subId: subId)) { (result: Result<CatFavoriteResponse, Error>) in
            switch result {
            case .success(let response):
                self.success = true
                self.error = false
                self.favorite = response
            case .failure(let error):
                self.errorMessage = error.localizedDescription
                self.error = true
                self.success = false 
            }
        }
    }   
    
    func deleteFavorite(forFavoriteId favoriteId: Int32) {
        networkService.request(endpoint: .deleteFavoriteCat(favouriteId: favoriteId)) { (result: Result<EmptyResponse, Error>) in
            switch result {
            case .success(_):
                self.success = true
                self.error = false
                self.favorite = nil
            case .failure(_):
                self.success = false
                self.error = true
            }
        }
    }
}
