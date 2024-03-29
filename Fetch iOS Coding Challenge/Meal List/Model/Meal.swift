//
//  Meal.swift
//  Fetch iOS Coding Challenge
//
//  Created by Dan Pham on 2/5/24.
//

struct Meals: Decodable {
    var meals: [Meal]
}

struct Meal: Identifiable {
    var id: String
    var title: String
    var thumbnailURL: String
}

extension Meal: Decodable {
    enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case title = "strMeal"
        case thumbnailURL = "strMealThumb"
    }
}

extension Meal: Comparable {
    static func < (lhs: Meal, rhs: Meal) -> Bool {
        lhs.title < rhs.title
    }
}
