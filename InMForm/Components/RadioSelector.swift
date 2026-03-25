//
//  RadioSelector.swift
//  InMForm
//
//  Created by Brian Kabiru on 24/03/2026.
//

import SwiftUI

struct RadioSelector: View {
    // properties
    let options: [String]
    @Binding var selected: String
    
    // body
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            ForEach(options, id: \.self) { option in
                Button(action: {
                    withAnimation(.easeInOut) {
                        selected = option
                    }
                }) {
                    HStack {
                        Image(systemName: selected == option
                              ? "largecircle.fill.circle"
                              : "circle")
                        .foregroundColor(selected == option ? .cyan : .gray)
                        .font(.system(size: 22))
                        
                        Text(option)
                            .foregroundColor(.black)
                        Spacer()
                    }
                    .padding(.vertical, 4)
                }
            }
        }
    }
}

// preview
struct RadioSelector_Preview: PreviewProvider {
    static var previews: some View {
        RadioSelector(options: ["Male", "Female"],
                      selected: .constant("Male")
        )
        .padding()
        .previewLayout(.sizeThatFits)
    }
}
