//
//  HeaderView.swift
//  Fetch iOS Coding Challenge
//
//  Created by Dan Pham on 2/6/24.
//

import SwiftUI

struct HeaderView: View {
    let meal: MealDetail
    
    var body: some View {
        MealThumbnail(thumbnailURL: meal.thumbnailURL)
            .frame(height: 400)
        
        Text(meal.title)
            .font(.title2)
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    HeaderView(meal: SampleData.mealDetail)
}
