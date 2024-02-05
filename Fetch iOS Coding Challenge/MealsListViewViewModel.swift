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
        let meals: [Meal] = SampleData.meals
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
