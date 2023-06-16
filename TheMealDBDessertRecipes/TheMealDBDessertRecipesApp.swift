//
//  TheMealDBDessertRecipesApp.swift
//  TheMealDBDessertRecipes
//
//  Created by Fatima Jamil on 6/15/23.
//

import SwiftUI

/// Main entry point of the application, defines the main scene with the DessertListScreen as the root view
@main
struct TheMealDBDessertRecipesApp: App {
    var body: some Scene {
        WindowGroup {
            DessertListScreen()
        }
    }
}
