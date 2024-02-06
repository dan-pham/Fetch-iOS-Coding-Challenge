//
//  MealsListView.swift
//  Fetch iOS Coding Challenge
//
//  Created by Dan Pham on 2/1/24.
//

import SwiftUI

struct MealsListView: View {
    
    @State private var viewModel = ViewModel()
    
    var body: some View {
        NavigationStack {
            List(viewModel.meals) { meal in
                ZStack {
                    NavigationLink {
                        MealDetailView(mealID: meal.id)
                    } label: {
                        EmptyView()
                    }
                    
                    MealListCellView(meal: meal)
                }
                .listRowSeparator(.hidden)
                
            }
            .scrollContentBackground(.hidden)
            .navigationTitle(Text("Desserts"))
        }
        .task {
            await viewModel.loadMealsData()
        }
    }
}

#Preview {
    MealsListView()
}
