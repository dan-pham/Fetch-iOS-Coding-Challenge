//
//  MealsListView.swift
//  Fetch iOS Coding Challenge
//
//  Created by Dan Pham on 2/1/24.
//

import SwiftUI

struct MealsListView: View {
    
    @State private var viewModel = ViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.meals) { meal in
                    MealListCellView(meal: meal)
                }
                .listRowSeparator(.hidden)
            }
            .scrollContentBackground(.hidden)
            .navigationTitle(Text("Desserts"))
        }
    }
}

#Preview {
    MealsListView()
}


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

struct MealThumbnail: View {
    let thumbnailURL: String
    
    var body: some View {
        AsyncImage(url: URL(string: thumbnailURL)) { phase in
            switch phase {
            case .success(let image):
                image.resizable()
                
            case .failure:
                ImagePlaceholder()
                
            case .empty:
                ProgressView()
                
            @unknown default:
                ImagePlaceholder()
            }
        }
        .frame(width: 64, height: 64)
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

struct ImagePlaceholder: View {
    var body: some View {
        Color.gray
    }
}
