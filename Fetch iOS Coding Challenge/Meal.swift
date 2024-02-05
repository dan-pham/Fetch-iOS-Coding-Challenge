//
//  Meal.swift
//  Fetch iOS Coding Challenge
//
//  Created by Dan Pham on 2/5/24.
//

struct Meal: Identifiable {
    let id: String
    let title: String
    let thumbnailURL: String
    
    init(id: String, title: String, thumbnailURL: String) {
        self.id = id
        self.title = title
        self.thumbnailURL = thumbnailURL
    }
}
