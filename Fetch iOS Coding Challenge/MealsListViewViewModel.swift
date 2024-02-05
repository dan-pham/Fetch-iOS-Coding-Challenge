//
//  MealsListViewViewModel.swift
//  Fetch iOS Coding Challenge
//
//  Created by Dan Pham on 2/5/24.
//

import Foundation

extension MealsListView {
    @Observable
    class ViewModel {
        var meals: [Meal] = SampleData.meals
        
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
                print("Error retrieving data from TheMealDB: \(error.localizedDescription)")
            }
        }
    }
}

extension MealsListView {
    private enum TheMealDBEndpoints: String {
        case dessertCategory = "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert"
    }
}

struct SampleData {
    static let meal = Meal(id: "52893", title: "Apple & Blackberry Crumble", thumbnailURL: "https://www.themealdb.com/images/media/meals/xvsurr1511719182.jpg")
    static let meals: [Meal] = [
        Meal(id: "52893", title: "Apple & Blackberry Crumble", thumbnailURL: "https://www.themealdb.com/images/media/meals/xvsurr1511719182.jpg"),
        Meal(id: "52768", title: "Apple Frangipan Tart", thumbnailURL: "https://www.themealdb.com/images/media/meals/wxywrq1468235067.jpg"),
        Meal(id: "52855", title: "Banana Pancakes", thumbnailURL: "https://www.themealdb.com/images/media/meals/sywswr1511383814.jpg")
    ]
}
