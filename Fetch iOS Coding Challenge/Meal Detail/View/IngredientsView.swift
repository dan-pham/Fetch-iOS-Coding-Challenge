//
//  IngredientsView.swift
//  Fetch iOS Coding Challenge
//
//  Created by Dan Pham on 2/6/24.
//

import SwiftUI

struct IngredientsView: View {
    let composedIngredients: [String]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Ingredients")
                .font(.title3)
            
            ForEach(composedIngredients, id: \.self) { ingredient in
                Text(ingredient)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    let viewModel = MealDetailView.ViewModel()
    viewModel.composeIngredientList(meal: SampleData.mealDetail)
    return IngredientsView(composedIngredients: viewModel.composedIngredients)
}
