//
//  MealsListViewViewModel.swift
//  Fetch iOS Coding Challenge
//
//  Created by Dan Pham on 2/5/24.
//

import Foundation
import Observation

@Observable
final class MealsListViewModel {
    private(set) var meals: [Meal] = []
    private(set) var errorMessage = String()
    var showingAlert = false
    
    private let url = URL(string: NetworkManager.TheMealDBEndpoints.dessertCategory.rawValue)
    
    func loadMealsData() async {
        NetworkManager.shared.loadMealData(from: url) { [weak self] (result: Result<Meals, Error>) in
            switch result {
            case .success(let decodedResponse):
                self?.meals = decodedResponse.meals.sorted()
                
            case .failure(let error):
                self?.errorMessage = error.localizedDescription
                self?.showingAlert = true
            }
        }
    }
}
