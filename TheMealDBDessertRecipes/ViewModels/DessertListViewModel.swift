//
//  DessertListViewModel.swift
//  TheMealDBDessertRecipes
//
//  Created by Fatima Jamil on 6/15/23.
//

import Foundation
import SwiftUI

@MainActor
class DessertListViewModel: ObservableObject {
    @Published var recipes: [Meal] = []
    var dessertDetailViewModel: DessertDetailViewModel
    var webservice: Webservice

    @Published var selectedDessert: Meal?
    
    init(webservice: Webservice = Webservice()) {
        self.webservice = webservice
        dessertDetailViewModel = DessertDetailViewModel(dessertId: "")
    }
    
    func populateCategories(using webservice: Webservice? = nil) async {
        let webServiceToUse = webservice ?? self.webservice
        
        do {
            let dessertListResponse = try await webServiceToUse.get(url: Constants.Urls.dessertListUrl) { data in
                return try? JSONDecoder().decode(DessertListResponse.self, from: data)
            }
            
            if let dessertList = dessertListResponse.meals {
                self.recipes = dessertList
            } else {
                // Handle the case when meals is nil
                self.recipes = []
            }
        } catch {
            print(error)
        }
    }
    
    func selectDessert(_ dessert: Meal) {
        selectedDessert = dessert
        dessertDetailViewModel = DessertDetailViewModel(dessertId: dessert.idMeal)
    }
}