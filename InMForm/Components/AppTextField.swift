//
//  AppTextField.swift
//  InMForm
//
//  Created by Brian Kabiru on 24/03/2026.
//

import SwiftUI

struct AppTextField: View {
    // MARK: - PROPERTIES
    let placeholder: String
    @Binding var text: String
    var keyboardType: UIKeyboardType = .default
    var isSecure: Bool = false
    var isValid: Bool? = nil
    var showErrors: Bool = false
    
    @State private var isEditing: Bool = false
    @State private var hasInteracted: Bool = false
    
    // MARK: - BODY
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            ZStack {
                // background border
                RoundedRectangle(cornerRadius: 8)
                    .stroke(borderColor, lineWidth: 1)
                // textfield
                if isSecure {
                    SecureField(placeholder, text: $text)
                        .padding(.horizontal)
                        .frame(height: 50)
                        .keyboardType(keyboardType)
                        .onTapGesture {
                            isEditing = true
                        }
                } else {
                    TextField(placeholder, text: $text, onEditingChanged: { editing in withAnimation(.easeInOut) {
                        isEditing = editing
                        if editing {
                            hasInteracted = true
                        }
                    }
                    })
                        .padding(.horizontal)
                        .frame(height: 50)
                        .keyboardType(keyboardType)
                        
                }
            }
        }
    }
    // MARK: - BORDER COLOR LOGIC
    private var borderColor: Color {
        if showErrors {
            if let valid = isValid {
                return valid ? .green : .red
            }
            return .red
        }
        if hasInteracted {
            if let valid = isValid {
                return valid ? Color.green : Color.red
            }
        }
        // if let valid = isValid {
            // return valid ? .green : .red
        // }
        return Color.gray.opacity(0.5)
    }
}

//preview sample
struct AppTextField_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 20) {
            AppTextField(placeholder: "First Name", text: .constant(""))
            AppTextField(placeholder: "Valid Field",
                         text: .constant("Hello"),
            isValid: true
            )
            AppTextField(placeholder: "Invalid Field", text: .constant("123"),
            isValid: false
            )
        }
        .padding()
        .previewLayout(.sizeThatFits)
    }
}
