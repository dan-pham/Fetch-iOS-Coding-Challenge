//
//  MealDetailView.swift
//  Fetch iOS Coding Challenge
//
//  Created by Dan Pham on 2/5/24.
//

import SwiftUI
import Observation

struct MealDetailView: View {
    
    @Bindable private var viewModel = MealDetailViewModel()
    
    let mealID: String
    
    init(mealID: String) {
        self.mealID = mealID
    }
    
    var body: some View {
        ScrollView {
            if let meal = viewModel.meal {
                VStack(spacing: 16) {
                    HeaderView(meal: meal)
                    
                    IngredientsView(ingredients: meal.ingredients)
                    
                    InstructionsView(instructions: meal.instructions)
                }
            } else {
                ProgressView()
                    .padding(.top, 200)
                    .frame(maxWidth: .infinity)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .background(.offWhite)
        .task {
            await viewModel.loadMealDetailData(for: mealID)
        }
        .alert(viewModel.errorMessage, isPresented: $viewModel.showingAlert) { }
    }
}

#Preview {
    MealDetailView(mealID: SampleData.meal.id)
}
