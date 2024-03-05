//
//  SampleData.swift
//  Fetch iOS Coding Challenge
//
//  Created by Dan Pham on 2/6/24.
//

import Foundation

struct SampleData {
    private init() { }
    
    static let meal = Meal(id: "52893", title: "Apple & Blackberry Crumble", thumbnailURL: "https://www.themealdb.com/images/media/meals/xvsurr1511719182.jpg")
    
    static let meals: [Meal] = [
        Meal(id: "52893", title: "Apple & Blackberry Crumble", thumbnailURL: "https://www.themealdb.com/images/media/meals/xvsurr1511719182.jpg"),
        Meal(id: "52768", title: "Apple Frangipan Tart", thumbnailURL: "https://www.themealdb.com/images/media/meals/wxywrq1468235067.jpg"),
        Meal(id: "52855", title: "Banana Pancakes", thumbnailURL: "https://www.themealdb.com/images/media/meals/sywswr1511383814.jpg")
    ]
    
    static let mealDetail = MealDetail(
        id: "52855",
        title: "Banana Pancakes",
        category: "Dessert",
        area: "American",
        instructions: "In a bowl, mash the banana with a fork until it resembles a thick purée. Stir in the eggs, baking powder and vanilla.\r\nHeat a large non-stick frying pan or pancake pan over a medium heat and brush with half the oil. Using half the batter, spoon two pancakes into the pan, cook for 1-2 mins each side, then tip onto a plate. Repeat the process with the remaining oil and batter. Top the pancakes with the pecans and raspberries.",
        thumbnailURL: "https://www.themealdb.com/images/media/meals/sywswr1511383814.jpg",
        
        ingredients: [
            "• 1 large Banana",
            "• 2 medium Eggs",
            "• pinch Baking Powder",
            "• spinkling Vanilla Extract",
            "• 1 tsp Oil",
            "• 25g Pecan Nuts",
            "• 125g large Raspberries",
        ]
    )
}
