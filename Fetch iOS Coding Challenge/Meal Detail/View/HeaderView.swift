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
        VStack {
            MealThumbnail(thumbnailURL: meal.thumbnailURL)
                .frame(height: 400)
            
            VStack(alignment: .leading) {
                Text(meal.title)
                    .font(.title2)
                
                Text(formatDescription(category: meal.category, area: meal.area))
                    .font(.headline)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .background(.white)
    }
}

#Preview {
    HeaderView(meal: SampleData.mealDetail)
}

extension HeaderView {
    private func formatDescription(category: String?, area: String?) -> String {
        switch (category, area) {
        case let (category?, area?):
            return "\(category) | \(area)"
        case let (category?, _):
            return category
        case let (_, area?):
            return area
        case (.none, .none):
            return ""
        }
    }
}
