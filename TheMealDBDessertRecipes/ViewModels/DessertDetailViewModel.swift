//
//  DessertDetailViewModel.swift
//  TheMealDBDessertRecipes
//
//  Created by Fatima Jamil on 6/15/23.
//

import Foundation

class DessertDetailViewModel: ObservableObject {
    @Published var recipeDetail: RecipeDetail?
    @Published var error: Error?
    
    struct IngredientMeasurement: Identifiable {
        let id = UUID()
        let ingredient: String
        let measurement: String
    }
    
    internal let dessertId: String
    
    init(dessertId: String = "") {
        self.dessertId = dessertId
    }
    
    func fetchRecipeDetails(using webservice: Webservice = Webservice()) async {
        let url = Constants.Urls.recipeDetailsUrl(for: dessertId)
        
        do {
            self.recipeDetail = try await webservice.get(url: url, parse: { data in
                let decoder = JSONDecoder()
                let response = try decoder.decode(DessertDetailResponse.self, from: data)
                return response.meals?.first
            })
            print("Recipe details fetched successfully")
            
        } catch {
            self.error = error
            print("Failed to fetch recipe details: \(error)")

        }
    }
}
