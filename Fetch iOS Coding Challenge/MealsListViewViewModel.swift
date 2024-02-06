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
    
    static let mealDetail = MealDetail(
        id: "52855",
        title: "Banana Pancakes",
        drinkAlternate: "",
        category: "Dessert",
        area: "American",
        instructions: "In a bowl, mash the banana with a fork until it resembles a thick purée. Stir in the eggs, baking powder and vanilla.\r\nHeat a large non-stick frying pan or pancake pan over a medium heat and brush with half the oil. Using half the batter, spoon two pancakes into the pan, cook for 1-2 mins each side, then tip onto a plate. Repeat the process with the remaining oil and batter. Top the pancakes with the pecans and raspberries.",
        thumbnailURL: "https://www.themealdb.com/images/media/meals/sywswr1511383814.jpg",
        tags: "Breakfast,Desert,Sweet",
        youtubeURL: "https://www.youtube.com/watch?v=kSKtb2Sv-_U",
        ingredient1: "Banana",
        ingredient2: "Eggs",
        ingredient3: "Baking Powder",
        ingredient4: "Vanilla Extract",
        ingredient5: "Oil",
        ingredient6: "Pecan Nuts",
        ingredient7: "Raspberries",
        ingredient8: "",
        ingredient9: "",
        ingredient10: "",
        ingredient11: "",
        ingredient12: "",
        ingredient13: "",
        ingredient14: "",
        ingredient15: "",
        ingredient16: "",
        ingredient17: "",
        ingredient18: "",
        ingredient19: "",
        ingredient20: "",
        measurement1: "1 large",
        measurement2: "2 medium",
        measurement3: "pinch",
        measurement4: "spinkling",
        measurement5: "1 tsp ",
        measurement6: "25g",
        measurement7: "125g",
        measurement8: "",
        measurement9: "",
        measurement10: "",
        measurement11: "",
        measurement12: "",
        measurement13: "",
        measurement14: "",
        measurement15: "",
        measurement16: "",
        measurement17: "",
        measurement18: "",
        measurement19: "",
        measurement20: "",
        source: "https://www.bbcgoodfood.com/recipes/banana-pancakes",
        imageSourceURL: "",
        creativeCommonsConfirmed: "",
        dateModified: ""
    )
}
