//
//  MealDetailViewModel.swift
//  Fetch iOS Coding Challenge
//
//  Created by Dan Pham on 2/6/24.
//

import Foundation
import Observation

extension MealDetailView {
    @Observable
    final class ViewModel {
        private(set) var meal: MealDetail? = nil {
            didSet {
                if let meal = meal {
                    composeIngredientList(meal: meal)
                }
            }
        }
        private(set) var composedIngredients = [String]()
        private(set) var errorMessage = String()
        var showingAlert = false
        
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
                    }
                }
            } catch let error {
                errorMessage = error.localizedDescription
                showingAlert = true
            }
        }
        
        func composeIngredientList(meal: MealDetail) {
            let allMeasurements = [
                meal.measurement1, meal.measurement2, meal.measurement3, meal.measurement4, meal.measurement5,
                meal.measurement6, meal.measurement7, meal.measurement8, meal.measurement9, meal.measurement10,
                meal.measurement11, meal.measurement12, meal.measurement13, meal.measurement14, meal.measurement15,
                meal.measurement16, meal.measurement17, meal.measurement18, meal.measurement19, meal.measurement20
            ].compactMap { $0 }.filter { !$0.isEmpty }
            
            let allIngredients = [
                meal.ingredient1, meal.ingredient2, meal.ingredient3, meal.ingredient4, meal.ingredient5,
                meal.ingredient6, meal.ingredient7, meal.ingredient8, meal.ingredient9, meal.ingredient10,
                meal.ingredient11, meal.ingredient12, meal.ingredient13, meal.ingredient14, meal.ingredient15,
                meal.ingredient16, meal.ingredient17, meal.ingredient18, meal.ingredient19, meal.ingredient20
            ].compactMap { $0 }.filter { !$0.isEmpty }
            
            let numberOfIngredients = allIngredients.count
            
            for index in 0..<numberOfIngredients {
                let composedIngredient = "• " + formattedMeasurement(for: allMeasurements[index]) + " " + formattedIngredient(for: allIngredients[index])
                composedIngredients.append(composedIngredient)
            }
        }
        
        private func formattedMeasurement(for measurement: String) -> String {
            var measurement = measurement.trimmingCharacters(in: .whitespaces)
            let firstCharacter = measurement.first!
            measurement = firstCharacter.isLetter ? measurement.capitalized : measurement.lowercased()
            return measurement
        }
        
        private func formattedIngredient(for ingredient: String) -> String {
            let ingredient = ingredient.lowercased().trimmingCharacters(in: .whitespaces)
            return ingredient
        }
    }
}
