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
                    .frame(width: 64, height: 64)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                
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
    MealListCellView(meal: SampleData.meal)
}
