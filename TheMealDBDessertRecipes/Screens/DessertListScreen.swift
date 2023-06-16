//
//  DessertListScreen.swift
//  TheMealDBDessertRecipes
//
//  Created by Fatima Jamil on 6/15/23.
//

import Foundation
import SwiftUI

struct DessertListScreen: View {
    @StateObject var viewModel = DessertListViewModel()

    var body: some View {
        NavigationView {
            DessertListView(viewModel: viewModel)
                .task {
                    await viewModel.populateCategories()
                }
        }
    }
}

struct DessertListScreen_Previews: PreviewProvider {
    static var previews: some View {
        DessertListScreen()
    }
}
