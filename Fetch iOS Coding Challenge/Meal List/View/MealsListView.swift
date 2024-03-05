//
//  MealsListView.swift
//  Fetch iOS Coding Challenge
//
//  Created by Dan Pham on 2/1/24.
//

import SwiftUI
import Observation

struct MealsListView: View {
    
    @State private var viewModel = MealsListViewModel()
    
    var body: some View {
        NavigationStack {
            if !viewModel.meals.isEmpty {
                List(viewModel.meals) { meal in
                    MealDetailNavigationView(meal: meal)
                        .listRowSeparator(.hidden)
                }
                .scrollContentBackground(.hidden)
                .navigationTitle(Text("Desserts"))
            } else {
                ProgressView()
            }
        }
        .task {
            await viewModel.loadMealsData()
        }
        .alert(viewModel.errorMessage, isPresented: $viewModel.showingAlert) { }
    }
}

#Preview {
    MealsListView()
}
