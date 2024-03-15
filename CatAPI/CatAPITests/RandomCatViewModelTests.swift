//
//  RandomCatViewModelTests.swift
//  CatAPITests
//
//  Created by J on 13/3/24.
//

import XCTest
@testable import CatAPI

class RandomCatViewModelTests: XCTestCase {
    var viewModel: RandomCatViewModel!
    var mockNetworkService: MockNetworkService!
    var userId = "userIdTest"
    
    override func setUp() {
        super.setUp()
        mockNetworkService = MockNetworkService()
        viewModel = RandomCatViewModel(networkService: mockNetworkService)
    }
    
    override func tearDown() {
        viewModel = nil
        mockNetworkService = nil
        super.tearDown()
    }
    
    func testFetchRandomCatImageSuccess() {
        let expectedCatImage = [CatImage(id: "1", url: "https://example.com/cat.jpg")]
        mockNetworkService.mockResult = expectedCatImage
        
        let expectation = XCTestExpectation(description: "Fetch random cat image succeeds")
        
        viewModel.fetchRandomCatImage()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
            XCTAssertNotNil(self?.viewModel.catImage)
            XCTAssertEqual(self?.viewModel.catImage?.url, expectedCatImage[0].url)
            XCTAssertFalse(self?.viewModel.isLoading ?? true)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 2.0)
    }
    
    func testFetchRandomCatImageFailure() {
        let mockError = NSError(domain: "testError", code: 0, userInfo: nil)
        mockNetworkService.mockResult = mockError
        
        let expectation = XCTestExpectation(description: "Fetch random cat image fails")
        
        viewModel.fetchRandomCatImage()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
            XCTAssertNil(self?.viewModel.catImage)
            XCTAssertTrue(self?.viewModel.errorMessage?.isEmpty == false)
            XCTAssertFalse(self?.viewModel.isLoading ?? true)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 2.0)
    }
    
    func testCreateFavoriteSuccess() {
        let successResponse = CatFavoriteResponse(message: "SUCCESS", id: 123)
        mockNetworkService.mockResult = successResponse
        
        let expectation = XCTestExpectation(description: "CreateFavoriteSuccess")
        
        viewModel.createFavorite(forImageId: "testImageId", subId: userId)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            XCTAssertTrue(self.viewModel.success == true, "Expected successful creation state to be updated")
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 2.0)
    }
    
    func testCreateFavoriteFailure() {
        let mockError = NSError(domain: "testError", code: 0, userInfo: nil)
        mockNetworkService.mockResult = mockError
        
        let expectation = XCTestExpectation(description: "Fetch random cat image fails")
        
        viewModel.createFavorite(forImageId: "testImageId", subId: userId)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
            XCTAssertTrue(self?.viewModel.success == false, "Expected successful creation state to be updated")
            XCTAssertTrue(self?.viewModel.errorMessage?.isEmpty == false)
            XCTAssertFalse(self?.viewModel.isLoading ?? true)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 2.0)
    }
    
    func testDeleteFavoriteSuccess() {
        let successResponse = EmptyResponse(message: "SUCCESS")
        mockNetworkService.mockResult = successResponse
        
        let expectation = XCTestExpectation(description: "DeleteFavoriteSuccess")
        
        viewModel.deleteFavorite(forFavoriteId: 123)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            XCTAssertTrue(self.viewModel.success == true, "Expected successful creation state to be updated")
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 2.0)
    }
    
    func testDeleteFavoriteFailure() {
        let mockError = NSError(domain: "testError", code: 0, userInfo: nil)
        mockNetworkService.mockResult = mockError
        
        let expectation = XCTestExpectation(description: "Fetch random cat image fails")
        
        viewModel.deleteFavorite(forFavoriteId: 123)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
            XCTAssertTrue(self?.viewModel.success == false, "Expected successful creation state to be updated")
            XCTAssertFalse(self?.viewModel.isLoading ?? true)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 2.0)
    }
}
