//
//  DessertDetailView.swift
//  TheMealDBDessertRecipes
//
//  Created by Fatima Jamil on 6/15/23.
//

import Foundation
import SwiftUI
struct DessertDetailView: View {
    @StateObject private var viewModel: DessertDetailViewModel
    let bounds = UIScreen.main.bounds
    let dessertId: String

    init(dessertId: String) {
        self.dessertId = dessertId
        _viewModel = StateObject(wrappedValue: DessertDetailViewModel(dessertId: dessertId))
    }
    var body: some View {
        
        List {
            // Rest of view...
            if let dessertName = viewModel.recipeDetail?.strMeal, !dessertName.isEmpty {
                Text("\(dessertName.capitalized)")
                    .font(.largeTitle)
                    .fontWeight(.bold)
            }
            
            if let imageUrl = URL(string: viewModel.recipeDetail?.strMealThumb ?? "") {
                AsyncImage(url: imageUrl) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: bounds.width * 0.6)
                        .clipped()
                        .listRowInsets(EdgeInsets())
                } placeholder: {
                    ProgressView()
                }
            }

            if let ingredients = viewModel.recipeDetail?.ingredients, let measurements = viewModel.recipeDetail?.measurements {
                VStack(alignment: .leading, spacing: 2) {
                    Text("Ingredients:")
                        .font(.title)
                        .fontWeight(.bold)
                    ForEach(Array(zip(ingredients, measurements)).indices, id: \.self) { index in
                        let ingredient = ingredients[index]
                        let measurement = measurements[index]
                        
                        if !ingredient.isEmpty {
                            let capitalizedIngredient = ingredient.capitalized
                            HStack {
                                Text("\(capitalizedIngredient):")
                                    .font(.body)
                                Text(measurement)
                                    .font(.body)
                                    .italic() // Apply the .italic() modifier only to the measurement
                            }

                        }
                    }
                }
            }
            
            if let instructions = viewModel.recipeDetail?.strInstructions,
               !instructions.isEmpty {
                VStack(alignment: .leading, spacing: 0) {
                    Text("Instructions:")
                        .font(.title)
                        .fontWeight(.bold)
                    let sentenceComponents = instructions.components(separatedBy: CharacterSet(charactersIn: ".\r\n")).filter { !$0.isEmpty }
                    ForEach(0..<sentenceComponents.count, id: \.self) { index in
                        let sentence = sentenceComponents[index]
                        if !sentence.isEmpty {
                            let steps = sentence.components(separatedBy: "\r\n")
                            ForEach(steps, id: \.self) { step in
                                if !step.isEmpty {
                                    Text("\(index + 1). \(step.trimmingCharacters(in: .whitespaces))")
                                        .font(.body)
                                        .multilineTextAlignment(.leading)
                                        .listRowSeparator(.hidden) // Hide separator line
                                        .padding(.bottom, 0)
                                }
                            }
                        }
                    }
                }
            }

        }
        .listStyle(InsetGroupedListStyle())
        .navigationBarTitle("", displayMode: .inline) // Empty title
        .padding(.top, -30)
        //.onAppear {
        //    viewModel.fetchRecipeDetails()
        //}
        .task {
            await viewModel.fetchRecipeDetails()
        }
    }
}
