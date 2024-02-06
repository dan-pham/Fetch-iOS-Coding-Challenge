//
//  MealDetailView.swift
//  Fetch iOS Coding Challenge
//
//  Created by Dan Pham on 2/5/24.
//

import SwiftUI

struct MealDetailView: View {
    
    let mealID: String
    @State var meal: MealDetail? = nil
    @State var composedIngredients = [String]()
    
    init(mealID: String) {
        self.mealID = mealID
    }
    
    var body: some View {
        ScrollView {
            if let meal = meal {
                MealThumbnail(thumbnailURL: meal.thumbnailURL)
                    .frame(height: 400)
                
                Text(meal.title)
                    .font(.title2)
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                VStack(alignment: .leading) {
                    Text("Ingredients")
                        .font(.title3)
                    
                    ForEach(composedIngredients, id: \.self) { ingredient in
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
            await loadMealDetailData(for: mealID)
        }
    }
    
    func composeIngredientList() {
        guard let meal = meal else { return }
        var allMeasurements = [
            meal.measurement1, meal.measurement2, meal.measurement3, meal.measurement4, meal.measurement5,
            meal.measurement6, meal.measurement7, meal.measurement8, meal.measurement9, meal.measurement10,
            meal.measurement11, meal.measurement12, meal.measurement13, meal.measurement14, meal.measurement15,
            meal.measurement16, meal.measurement17, meal.measurement18, meal.measurement19, meal.measurement20
        ].compactMap { $0 }.filter { !$0.isEmpty }
        
        var allIngredients = [
            meal.ingredient1, meal.ingredient2, meal.ingredient3, meal.ingredient4, meal.ingredient5,
            meal.ingredient6, meal.ingredient7, meal.ingredient8, meal.ingredient9, meal.ingredient10,
            meal.ingredient11, meal.ingredient12, meal.ingredient13, meal.ingredient14, meal.ingredient15,
            meal.ingredient16, meal.ingredient17, meal.ingredient18, meal.ingredient19, meal.ingredient20
        ].compactMap { $0 }.filter { !$0.isEmpty }
        
        let numberOfIngredients = allIngredients.count
        
        for index in 0..<numberOfIngredients {
            let composedIngredient = "• " + allMeasurements[index].trimmingCharacters(in: .whitespaces) + " " + allIngredients[index].lowercased().trimmingCharacters(in: .whitespaces)
            composedIngredients.append(composedIngredient)
        }
    }
    
    func loadMealDetailData(for id: String) async {
        let mealDetailURL = URL(string: TheMealDBEndpoints.fetchMealDetail.rawValue + id)
        
        guard let url = mealDetailURL else {
            fatalError("The meal detail URL is not valid")
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            if let decodedResponse = try? JSONDecoder().decode(MealsDetail.self, from: data){
                if let mealDetail = decodedResponse.meals.first {
                    meal = mealDetail
                    composeIngredientList()
                }
            }
        } catch let error {
            print("Error retrieving data from TheMealDB: \(error.localizedDescription)")
        }
    }
}

#Preview {
    MealDetailView(mealID: SampleData.meal.id)
}
