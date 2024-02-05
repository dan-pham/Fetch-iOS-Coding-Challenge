//
//  MealListCellView.swift
//  Fetch iOS Coding Challenge
//
//  Created by Dan Pham on 2/5/24.
//

import SwiftUI

struct MealListCellView: View {
    let meal: Meal
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 16) {
                MealThumbnail(thumbnailURL: meal.thumbnailURL)
                
                Text(meal.title)
                    .fontWeight(.medium)
                
                Spacer()
            }
        }
        .padding(16)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .shadow(color: Color(uiColor: .lightGray), radius: 2, x: 1, y: 1)
    }
}

#Preview {
    MealListCellView(meal: Meal(id: "52893", title: "Apple & Blackberry Crumble", thumbnailURL: "https://www.themealdb.com/images/media/meals/xvsurr1511719182.jpg"))
}
