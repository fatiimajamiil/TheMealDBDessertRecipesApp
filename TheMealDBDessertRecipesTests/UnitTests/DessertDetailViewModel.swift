//
//  DessertDetailViewModel.swift
//  TheMealDBDessertRecipesTests
//
//  Created by Fatima Jamil on 6/16/23.
//

import XCTest
@testable import TheMealDBDessertRecipes

final class DessertDetailViewModelTests: XCTestCase {
    
    var viewModel: DessertDetailViewModel!
    var webservice: MockWebservice!

    /// Sets up the necessary objects and configurations before each test case
    override func setUp() {
        super.setUp()
        viewModel = DessertDetailViewModel()
        webservice = MockWebservice()
    }
    
    ///Cleans up the objects and configurations after each test case
    override func tearDown() {
        viewModel = nil
        webservice = nil
        super.tearDown()
    }

    /// This test case validates that the fetchRecipeDetails() method correctly retrieves and processes the details of a dessert recipe. It mocks a successful response from the webservice using the MockWebservice class, and then verifies that the recipe details are correctly populated in the DessertDetailViewModel instance
    func testFetchRecipeDetails() async throws {
        // Given
        viewModel = DessertDetailViewModel(dessertId: "52893")
        do {
            let responseData = try MockDataLoader.loadMockData(fromFile: "MockDetailResponse")
            webservice.response = responseData
        } catch {
            XCTFail("Failed to load mock data: \(error)")
            return
        }
        
        // When
        let expectation = XCTestExpectation(description: "Fetch recipe details")
        await viewModel.fetchRecipeDetails(using: webservice)
        
        // Then
        await XCTWaiter().fulfillment(of: [expectation], timeout: 10.0)
        
        XCTAssertNotNil(viewModel.recipeDetail)
        XCTAssertEqual(viewModel.recipeDetail?.idMeal, "52893")
        XCTAssertEqual(viewModel.recipeDetail?.strMeal, "Apple & Blackberry Crumble")
        XCTAssertEqual(viewModel.recipeDetail?.ingredients.count, 9)
        XCTAssertEqual(viewModel.recipeDetail?.measurements.count, 9)
        XCTAssertEqual(viewModel.recipeDetail?.ingredients[0], "Plain Flour")
        XCTAssertEqual(viewModel.recipeDetail?.measurements[0], "120g")
        XCTAssertNil(viewModel.error, "Error should be nil")
    }

    /// This test case validates the error handling behavior of the fetchRecipeDetails() method. It mocks an error response from the webservice using the MockWebservice class, and then verifies that the error is correctly captured in the DessertDetailViewModel instance
    func testFetchRecipeDetailsWithError() async throws {
        // Given
        viewModel = DessertDetailViewModel(dessertId: "12345")
        do {
            let responseData = try MockDataLoader.loadMockData(fromFile: "MockDetailErrorResponse")
            webservice.response = responseData
        } catch {
            XCTFail("Failed to load mock data: \(error)")
            return
        }
        
        // When
        let expectation = XCTestExpectation(description: "Fetch recipe details with error")
        await viewModel.fetchRecipeDetails(using: webservice)
        
        // Then
        await XCTWaiter().fulfillment(of: [expectation], timeout: 10.0)
        
        XCTAssertNil(viewModel.recipeDetail)
        XCTAssertNotNil(viewModel.error)
        XCTAssertEqual(viewModel.error as? Webservice.NetworkError, .decodingError, "Error is not the expected decoding error")

    }

}
