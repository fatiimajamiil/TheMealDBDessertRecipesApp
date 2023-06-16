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

    override func setUp() {
        super.setUp()
        viewModel = DessertDetailViewModel()
        webservice = MockWebservice()
    }

    override func tearDown() {
        viewModel = nil
        webservice = nil
        super.tearDown()
    }

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
