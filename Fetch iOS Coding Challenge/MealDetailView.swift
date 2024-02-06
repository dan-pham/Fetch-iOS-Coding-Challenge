//
//  MealDetailView.swift
//  Fetch iOS Coding Challenge
//
//  Created by Dan Pham on 2/5/24.
//

import SwiftUI

struct MealDetailView: View {
    
    let meal: MealDetail
    
    var body: some View {
        ScrollView {
            MealThumbnail(thumbnailURL: meal.thumbnailURL)
                .frame(height: 400)
            
            Text(meal.title)
                .font(.title2)
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack(alignment: .leading) {
                Text("Ingredients")
                    .font(.title3)
                
                Text("• " + meal.measurement1 + " " + meal.ingredient1)
                Text("• " + meal.measurement2 + " " + meal.ingredient2)
                Text("• " + meal.measurement3 + " " + meal.ingredient3)
                Text("• " + meal.measurement4 + " " + meal.ingredient4)
                Text("• " + meal.measurement5 + " " + meal.ingredient5)
                Text("• " + meal.measurement6 + " " + meal.ingredient6)
                Text("• " + meal.measurement7 + " " + meal.ingredient7)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack(alignment: .leading) {
                Text("Instructions")
                    .font(.title3)
                
                Text(meal.instructions)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    MealDetailView(meal: SampleData.mealDetail)
}
