//
//  MealThumbnail.swift
//  Fetch iOS Coding Challenge
//
//  Created by Dan Pham on 2/5/24.
//

import SwiftUI

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
    }
}

struct ImagePlaceholder: View {
    var body: some View {
        Color.gray
    }
}
