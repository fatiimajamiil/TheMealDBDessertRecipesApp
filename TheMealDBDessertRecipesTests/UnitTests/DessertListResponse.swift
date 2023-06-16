//
//  DessertListResponse.swift
//  TheMealDBDessertRecipesTests
//
//  Created by Fatima Jamil on 6/16/23.
//

import XCTest
@testable import TheMealDBDessertRecipes


final class DessertListResponseTests: XCTestCase {
    
    func testDessertListResponseDecoding() throws {
        // Given
        let jsonData = try MockDataLoader.loadMockData(fromFile: "MockListResponse")
        
        // When
        let decoder = JSONDecoder()
        let response = try decoder.decode(DessertListResponse.self, from: jsonData)
        
        // Then
        XCTAssertNotNil(response.meals)
        XCTAssertEqual(response.meals?.count, 64)
        
        let firstMeal = response.meals?.first
        XCTAssertEqual(firstMeal?.idMeal, "53049")
        XCTAssertEqual(firstMeal?.strMeal, "Apam balik")
        XCTAssertEqual(firstMeal?.strMealThumb, "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg")
    }
}
