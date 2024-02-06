//
//  InstructionsView.swift
//  Fetch iOS Coding Challenge
//
//  Created by Dan Pham on 2/6/24.
//

import SwiftUI

struct InstructionsView: View {
    let instructions: String?
    
    var body: some View {
        if let instructions = instructions {
            VStack(alignment: .leading) {
                Text("Instructions")
                    .font(.title3)
                
                Text(instructions)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

#Preview {
    InstructionsView(instructions: SampleData.mealDetail.instructions)
}
