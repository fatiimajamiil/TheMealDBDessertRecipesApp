//
//  DessertDetailResponse.swift
//  TheMealDBDessertRecipesTests
//
//  Created by Fatima Jamil on 6/16/23.
//

import XCTest
@testable import TheMealDBDessertRecipes

final class DessertDetailResponseTests: XCTestCase {

    /// Tests the decoding of the DessertDetailResponse struct
    func testDessertDetailResponseDecoding() throws {
        // Given
        let jsonData = try MockDataLoader.loadMockData(fromFile: "MockDetailResponse")
        
        // When
        let decoder = JSONDecoder()
        let response = try decoder.decode(DessertDetailResponse.self, from: jsonData)
        
        // Then
        XCTAssertNotNil(response.meals)
        XCTAssertEqual(response.meals?.count, 1)
        
        // Verify the details of the first meal
        let meal = response.meals?.first
        XCTAssertEqual(meal?.idMeal, "52893")
        XCTAssertEqual(meal?.strMeal, "Apple & Blackberry Crumble")
        XCTAssertEqual(meal?.strMealThumb, "https://www.themealdb.com/images/media/meals/xvsurr1511719182.jpg")
        XCTAssertEqual(meal?.strCategory, "Dessert")
        XCTAssertEqual(meal?.strArea, "British")
        XCTAssertEqual(meal?.strInstructions, "Heat oven to 190C/170C fan/gas 5. Tip the flour and sugar into a large bowl. Add the butter, then rub into the flour using your fingertips to make a light breadcrumb texture. Do not overwork it or the crumble will become heavy. Sprinkle the mixture evenly over a baking sheet and bake for 15 mins or until lightly coloured.\r\nMeanwhile, for the compote, peel, core and cut the apples into 2cm dice. Put the butter and sugar in a medium saucepan and melt together over a medium heat. Cook for 3 mins until the mixture turns to a light caramel. Stir in the apples and cook for 3 mins. Add the blackberries and cinnamon, and cook for 3 mins more. Cover, remove from the heat, then leave for 2-3 mins to continue cooking in the warmth of the pan.\r\nTo serve, spoon the warm fruit into an ovenproof gratin dish, top with the crumble mix, then reheat in the oven for 5-10 mins. Serve with vanilla ice cream.")
        XCTAssertEqual(meal?.strTags, "Pudding")
        XCTAssertEqual(meal?.strYoutube, "https://www.youtube.com/watch?v=4vhcOwVBDO4")
        
        // Verify the ingredients and measurements
        XCTAssertEqual(meal?.strIngredient1, "Plain Flour")
        XCTAssertEqual(meal?.strIngredient2, "Caster Sugar")
        XCTAssertEqual(meal?.strIngredient3, "Butter")
        XCTAssertEqual(meal?.strIngredient4, "Braeburn Apples")
        XCTAssertEqual(meal?.strIngredient5, "Butter")
        XCTAssertEqual(meal?.strIngredient6, "Demerara Sugar")
        XCTAssertEqual(meal?.strIngredient7, "Blackberrys")
        XCTAssertEqual(meal?.strIngredient8, "Cinnamon")
        XCTAssertEqual(meal?.strIngredient9, "Ice Cream")
        XCTAssertEqual(meal?.strIngredient10, "")
        XCTAssertEqual(meal?.strIngredient11, "")
        XCTAssertEqual(meal?.strIngredient12, "")
        XCTAssertEqual(meal?.strIngredient13, "")
        XCTAssertEqual(meal?.strIngredient14, "")
        XCTAssertEqual(meal?.strIngredient15, "")
        XCTAssertEqual(meal?.strIngredient16, "")
        XCTAssertEqual(meal?.strIngredient17, "")
        XCTAssertEqual(meal?.strIngredient18, "")
        XCTAssertEqual(meal?.strIngredient19, "")
        XCTAssertEqual(meal?.strIngredient20, "")
        
        XCTAssertEqual(meal?.strMeasure1, "120g")
        XCTAssertEqual(meal?.strMeasure2, "60g")
        XCTAssertEqual(meal?.strMeasure3, "60g")
        XCTAssertEqual(meal?.strMeasure4, "300g")
        XCTAssertEqual(meal?.strMeasure5, "30g")
        XCTAssertEqual(meal?.strMeasure6, "30g")
        XCTAssertEqual(meal?.strMeasure7, "120g")
        XCTAssertEqual(meal?.strMeasure8, "¼ teaspoon")
        XCTAssertEqual(meal?.strMeasure9, "to serve")
        XCTAssertEqual(meal?.strMeasure10, "")
        XCTAssertEqual(meal?.strMeasure11, "")
        XCTAssertEqual(meal?.strMeasure12, "")
        XCTAssertEqual(meal?.strMeasure13, "")
        XCTAssertEqual(meal?.strMeasure14, "")
        XCTAssertEqual(meal?.strMeasure15, "")
        XCTAssertEqual(meal?.strMeasure16, "")
        XCTAssertEqual(meal?.strMeasure17, "")
        XCTAssertEqual(meal?.strMeasure18, "")
        XCTAssertEqual(meal?.strMeasure19, "")
        XCTAssertEqual(meal?.strMeasure20, "")
    }
}
