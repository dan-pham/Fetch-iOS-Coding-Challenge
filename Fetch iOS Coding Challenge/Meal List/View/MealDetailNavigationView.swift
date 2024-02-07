//
//  MealDetailNavigationView.swift
//  Fetch iOS Coding Challenge
//
//  Created by Dan Pham on 2/6/24.
//

import SwiftUI

struct MealDetailNavigationView: View {
    let meal: Meal
    
    var body: some View {
        ZStack {
            NavigationLink {
                MealDetailView(mealID: meal.id)
            } label: {
                EmptyView()
            }
            
            MealListCellView(meal: meal)
        }
    }
}

#Preview {
    MealDetailNavigationView(meal: SampleData.meal)
}
