//
//  Endpoints.swift
//  Fetch iOS Coding Challenge
//
//  Created by Dan Pham on 2/6/24.
//

import Foundation

enum TheMealDBEndpoints: String {
    case dessertCategory = "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert"
    case fetchMealDetail = "https://themealdb.com/api/json/v1/1/lookup.php?i="
}
