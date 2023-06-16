//
//  Constants.swift
//  TheMealDBDessertRecipes
//
//  Created by Fatima Jamil on 6/15/23.
//

import Foundation
struct Constants {
    struct Urls {
        static let dessertListUrl = URL(string: "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert")!
        
        static let baseUrl = "https://www.themealdb.com/api/json/v1/1/"
        
        static func recipeDetailsUrl(for mealId: String) -> URL {
            let urlString = "\(baseUrl)lookup.php?i=\(mealId)"
            return URL(string: urlString)!
        }
    }
}

