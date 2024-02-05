//
//  DessertListView.swift
//  Fetch iOS Coding Challenge
//
//  Created by Dan Pham on 2/1/24.
//

import SwiftUI

struct DessertItem: Identifiable {
    let id: String
    let title: String
    let thumbnail: String
    
    init(id: String, title: String, thumbnail: String) {
        self.id = id
        self.title = title
        self.thumbnail = thumbnail
    }
}

struct DessertListView: View {
    
    @State private var viewModel = ViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.dessertItems) { dessertItem in
                    DessertListCellView(dessertItem: dessertItem)
                }
                .listRowSeparator(.hidden)
            }
            .scrollContentBackground(.hidden)
            .navigationTitle(Text("Desserts"))
        }
    }
}

#Preview {
    DessertListView()
}


extension DessertListView {
    @Observable
    class ViewModel {
        let dessertItems: [DessertItem] = [
            DessertItem(id: "52893", title: "Apple & Blackberry Crumble", thumbnail: "https://www.themealdb.com/images/media/meals/xvsurr1511719182.jpg"),
            DessertItem(id: "52768", title: "Apple Frangipan Tart", thumbnail: "https://www.themealdb.com/images/media/meals/wxywrq1468235067.jpg"),
            DessertItem(id: "52855", title: "Banana Pancakes", thumbnail: "https://www.themealdb.com/images/media/meals/sywswr1511383814.jpg")
        ]
    }
}

struct DessertListCellView: View {
    let dessertItem: DessertItem
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 16) {
                Color.gray
                    .frame(width: 64, height: 64)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                
                Text(dessertItem.title)
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
