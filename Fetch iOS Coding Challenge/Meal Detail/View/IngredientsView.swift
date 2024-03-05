//
//  IngredientsView.swift
//  Fetch iOS Coding Challenge
//
//  Created by Dan Pham on 2/6/24.
//

import SwiftUI

struct IngredientsView: View {
    let ingredients: [String]
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .center) {
                Image(systemName: "checkmark.circle.fill")
                    .foregroundStyle(.mint)
                
                Text("Ingredients")
                    .bold()
            }
            .font(.title3)
            .padding(.bottom, 8)
            
            ForEach(ingredients, id: \.self) { ingredient in
                Text(ingredient)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(.white)
    }
}

#Preview {
    IngredientsView(ingredients: SampleData.mealDetail.ingredients)
}
