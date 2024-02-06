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
                
                Text(formatInstructions(for: instructions))
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
    
    private func formatInstructions(for instructions: String) -> String {
        instructions.replacingOccurrences(of: "\n", with: "\n\n")
    }
}

#Preview {
    InstructionsView(instructions: SampleData.mealDetail.instructions)
}
