//
//  MealsListViewViewModel.swift
//  Fetch iOS Coding Challenge
//
//  Created by Dan Pham on 2/5/24.
//

import Foundation
import Observation

extension MealsListView {
    @Observable
    final class ViewModel {
        private(set) var meals = [Meal]()
        private(set) var errorMessage = String()
        var showingAlert = false
        
        func loadMealsData() async {
            guard let url = URL(string: TheMealDBEndpoints.dessertCategory.rawValue) else {
                fatalError("The dessert category URL is not valid")
            }
            
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                
                if let decodedResponse = try? JSONDecoder().decode(Meals.self, from: data) {
                    meals = decodedResponse.meals.sorted()
                }
            } catch let error {
                errorMessage = error.localizedDescription
                showingAlert = true
            }
        }
    }
}
