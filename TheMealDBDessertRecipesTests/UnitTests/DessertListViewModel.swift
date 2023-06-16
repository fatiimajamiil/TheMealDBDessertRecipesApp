//
//  DessertListViewModel.swift
//  TheMealDBDessertRecipesTests
//
//  Created by Fatima Jamil on 6/16/23.
//

import XCTest
@testable import TheMealDBDessertRecipes

/// Unit tests for the DessertListViewModel class
final class DessertListViewModelTests: XCTestCase {
    
    var viewModel: DessertListViewModel!
    var webservice: MockWebservice!
    var dessert: Meal!
    
    /// Sets up the necessary objects and configurations before each test case
    @MainActor override func setUp() {
        super.setUp()
        viewModel = DessertListViewModel()
        webservice = MockWebservice()
    }
    
    ///Cleans up the objects and configurations after each test case
    override func tearDown() {
        viewModel = nil
        webservice = nil
        dessert = nil
        super.tearDown()
    }
    ///Tests the populateCategories() and selectDessert() methods of the DessertListViewModel class
    func testPopulateCategoriesAndSelectDessert() async throws {
        // Given
        do {
            let responseData = try MockDataLoader.loadMockData(fromFile: "MockListResponse")
            webservice.response = responseData
        } catch {
            XCTFail("Failed to load mock data: \(error)")
            return
        }
        
        // When
        let expectation = XCTestExpectation(description: "Populate categories")
        await viewModel.populateCategories(using: webservice)
        let recipes = await viewModel.recipes

        // Then
        await XCTWaiter().fulfillment(of: [expectation], timeout: 10.0)

        if let firstMeal = recipes.first {
            // Select the first meal as the dessert
            await viewModel.selectDessert(firstMeal)

            // Capture the selected dessert outside the autoclosure
            let selectedDessert = await viewModel.selectedDessert

            // Verify the selected dessert
            XCTAssertEqual(selectedDessert?.idMeal, firstMeal.idMeal, "Selected dessert idMeal does not match the expected value")
            XCTAssertEqual(selectedDessert?.strMeal, firstMeal.strMeal, "Selected dessert strMeal does not match the expected value")

        } else {
            XCTFail("No meals found in the recipes array")
        }
    }
}
