//
//  MealDetailView.swift
//  Fetch iOS Coding Challenge
//
//  Created by Dan Pham on 2/5/24.
//

import SwiftUI

struct MealDetailView: View {
    
    @State private var viewModel = ViewModel()
    
    var body: some View {
        ScrollView {
            MealThumbnail(thumbnailURL: viewModel.meal.thumbnailURL)
                .frame(height: 400)
            
            Text(viewModel.meal.title)
                .font(.title2)
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack(alignment: .leading) {
                Text("Ingredients")
                    .font(.title3)
                
                Text("• " + viewModel.meal.measurement1 + " " + viewModel.meal.ingredient1)
                Text("• " + viewModel.meal.measurement2 + " " + viewModel.meal.ingredient2)
                Text("• " + viewModel.meal.measurement3 + " " + viewModel.meal.ingredient3)
                Text("• " + viewModel.meal.measurement4 + " " + viewModel.meal.ingredient4)
                Text("• " + viewModel.meal.measurement5 + " " + viewModel.meal.ingredient5)
                Text("• " + viewModel.meal.measurement6 + " " + viewModel.meal.ingredient6)
                Text("• " + viewModel.meal.measurement7 + " " + viewModel.meal.ingredient7)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack(alignment: .leading) {
                Text("Instructions")
                    .font(.title3)
                
                Text(viewModel.meal.instructions)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .ignoresSafeArea()
        .task {
            await viewModel.loadMealDetailData()
        }
    }
}

#Preview {
    MealDetailView()
}

extension MealDetailView {
    @Observable
    class ViewModel {
        var meal: MealDetail = SampleData.mealDetail
        
        func loadMealDetailData() async {
            guard let url = URL(string: TheMealDBEndpoints.fetchMealDetail.rawValue + meal.id) else {
                fatalError("The meal detail URL is not valid")
            }
            
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                
                if let decodedResponse = try? JSONDecoder().decode(MealsDetail.self, from: data), let mealDetail = decodedResponse.meals.first {
                    meal = mealDetail
                }
            } catch let error {
                print("Error retrieving data from TheMealDB: \(error.localizedDescription)")
            }
        }
    }
}
