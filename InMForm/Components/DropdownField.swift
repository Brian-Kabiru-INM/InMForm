//
//  DropdownField.swift
//  InMForm
//
//  Created by Brian Kabiru on 24/03/2026.
//

import SwiftUI

struct DropdownField: View {
    // properties
    let placeholder: String
    let options: [String]
    @Binding var selection: String
    
    @State private var isExpanded: Bool = false
    @State private var isEditing: Bool = false
    var isValid: Bool? = nil
    // body
    var body: some View {
        VStack(spacing: 20) {
            Button(action: {
                withAnimation(.easeInOut) {
                    isExpanded.toggle()
                    isEditing = true
                }
            }) {
                HStack {
                    Text(selection.isEmpty ? placeholder : selection)
                        .foregroundColor(selection.isEmpty ? .gray : .black)
                    Spacer()
                    Image(systemName: "chevron.down")
                        .rotationEffect(.degrees(isExpanded ? 180 : 0))
                        .foregroundColor(.gray)
                }
                .padding(.horizontal)
                .frame(height: 50)
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(borderColor, lineWidth: 1)
                        .animation(.easeInOut, value: borderColor)
                )
            }
            // options list
            if isExpanded {
                VStack(spacing: 0) {
                    ForEach(options, id: \.self) { option in Button(action: {
                        withAnimation(.easeInOut) {
                            selection = option
                            isExpanded = false
                            isEditing = false
                        }
                    }) {
                        HStack {
                            Text(option)
                                .foregroundColor(.black)
                            Spacer()
                        }
                        .padding()
                        .background(Color.white)
                    }
                        // divider between options
                        if option != options.last {
                            Divider()
                        }
                    }
                }
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                )
                .transition(.opacity.combined(with: .move(edge: .top)))
                .zIndex(1)
            }
        }
    }
    private var borderColor: Color {
        if isEditing {
            if let validState = isValid {
                return validState ? Color.green : Color.red
            }
            return Color.gray.opacity(0.5)
        } else {
            return Color.gray.opacity(0.5)
        }
    }
}
// preview
struct DropdownField_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 20) {
            DropdownField(placeholder: "Select a salutation", options: ["Mr", "Mrs", "Ms", "Dr"], selection: .constant("")
            )
            DropdownField(placeholder: "Select Item", options: ["Option 1", "Option 2"], selection: .constant("Option 1")
            )
        }
        .padding()
        .previewLayout(.sizeThatFits)
    }
}
