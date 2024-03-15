//
//  CatFavoriteListViewModelTests.swift
//  CatAPITests
//
//  Created by J on 13/3/24.
//

import XCTest
@testable import CatAPI

class CatFavoriteListViewModelTests: XCTestCase {
    var viewModel: CatFavoriteListViewModel!
    var mockNetworkService: MockNetworkService!
    var userId = "userIdTest"
    
    override func setUp() {
        super.setUp()
        mockNetworkService = MockNetworkService()
        viewModel = CatFavoriteListViewModel(networkService: mockNetworkService)
    }
    
    override func tearDown() {
        viewModel = nil
        mockNetworkService = nil
        super.tearDown()
    }
    
    func testFetchFavoriteCatsSuccess() {
        let expectedCatFavorites = [CatFavorite(id: 123, userId: "userid", imageId: "xcd", subId: userId, createdAt: "data", image: CatImage(id: "456", url: "https://example.com/cat.jpg")), CatFavorite(id: 456, userId: "userid", imageId: "xcd", subId: userId, createdAt: "data", image: CatImage(id: "678", url: "https://example.com/cat2.jpg"))]
        
        mockNetworkService.mockResult = expectedCatFavorites
        
        let expectation = XCTestExpectation(description: "Fetch favorite cat images succeeds")
        
        viewModel.fetchFavoriteCats()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
            XCTAssertEqual(self?.viewModel.favorites.count, expectedCatFavorites.count)
            XCTAssertFalse(self?.viewModel.isLoading ?? true)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 2.0)
    }
    
    func testFetchFavoriteCatsFailure() {
        let mockError = NSError(domain: "testError", code: 0, userInfo: nil)
        mockNetworkService.mockResult = mockError
        
        let expectation = XCTestExpectation(description: "Fetch favorite cat images fails")
        
        viewModel.fetchFavoriteCats()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
            XCTAssertEqual(self?.viewModel.favorites.count, 0)
            XCTAssertFalse(self?.viewModel.isLoading ?? true)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 2.0)
    }
}
