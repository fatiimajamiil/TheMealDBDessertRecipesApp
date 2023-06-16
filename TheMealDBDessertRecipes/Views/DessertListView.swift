//
//  DessertListView.swift
//  TheMealDBDessertRecipes
//
//  Created by Fatima Jamil on 6/15/23.
//

import Foundation
import SwiftUI

struct DessertListView: View {
    @ObservedObject var viewModel: DessertListViewModel
    let indexLetters = Array("ABCDEFGHIJKLMNOPQRSTUVWXYZ") // Letters for index list

    var sortedRecipes: [Meal] {
        return viewModel.recipes.sorted { $0.strMeal < $1.strMeal }
    }

    var body: some View {
        NavigationView {
            ScrollViewReader { scrollViewProxy in
                List {
                    ForEach(indexLetters, id: \.self) { letter in
                        Section(header: Text(String(letter))) {
                            ForEach(sortedRecipes, id: \.idMeal) { recipe in
                                if recipe.strMeal.starts(with: String(letter)) {
                                    NavigationLink(destination: DessertDetailView(dessertId: recipe.idMeal)) {
                                        Text(recipe.strMeal.capitalized) // Capitalize the dessert name
                                    }
                                }
                            }
                        }
                    }
                }
                .listStyle(PlainListStyle())
                .navigationBarHidden(true)
                .onAppear {
                    Task {
                        await viewModel.populateCategories()
                    }
                }
            }
            .navigationBarTitle("Dessert Recipes", displayMode: .inline)
        }
    }
}
