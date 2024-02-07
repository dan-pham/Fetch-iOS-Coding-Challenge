//
//  MealDetailView.swift
//  Fetch iOS Coding Challenge
//
//  Created by Dan Pham on 2/5/24.
//

import SwiftUI

struct MealDetailView: View {
    
    private let viewModel = ViewModel()
    
    let mealID: String
    
    init(mealID: String) {
        self.mealID = mealID
    }
    
    var body: some View {
        ScrollView {
            if let meal = viewModel.meal {
                HeaderView(meal: meal)
                
                IngredientsView(composedIngredients: viewModel.composedIngredients)
                
                InstructionsView(instructions: meal.instructions)
            } else {
                ProgressView()
                    .padding(.top, 200)
            }
        }
        .task {
            await viewModel.loadMealDetailData(for: mealID)
        }
    }
}

#Preview {
    MealDetailView(mealID: SampleData.meal.id)
}
