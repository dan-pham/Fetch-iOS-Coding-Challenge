//
//  MealDetailView.swift
//  Fetch iOS Coding Challenge
//
//  Created by Dan Pham on 2/5/24.
//

import SwiftUI

struct MealDetailView: View {
    
    @ObservedObject var viewModel = ViewModel()
    
    let mealID: String
    
    init(mealID: String) {
        self.mealID = mealID
    }
    
    var body: some View {
        ScrollView {
            if let meal = viewModel.meal {
                MealThumbnail(thumbnailURL: meal.thumbnailURL)
                    .scaledToFill()
                    .frame(height: 400)
                
                Text(meal.title)
                    .font(.title2)
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                VStack(alignment: .leading) {
                    Text("Ingredients")
                        .font(.title3)
                    
                    ForEach(viewModel.composedIngredients, id: \.self) { ingredient in
                        Text(ingredient)
                    }
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                
                if let instructions = meal.instructions {
                    VStack(alignment: .leading) {
                        Text("Instructions")
                            .font(.title3)
                        
                        Text(instructions)
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
            } else {
                ProgressView()
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
