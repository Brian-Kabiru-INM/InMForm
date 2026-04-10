//
//  DOBInput.swift
//  InMForm
//
//  Created by Brian Kabiru on 24/03/2026.
//

import SwiftUI

struct DOBInput: View {
    // bindings
    @Binding var day: String
    @Binding var month: String
    @Binding var year: String

    var showErrors: Bool = false
    @State private var isEditing: Bool = false
    @State private var hasInteracted: Bool = false
    // body
    var body: some View {
        HStack(spacing: 12) {
            dateBox(text: $day, placeholder: "DD", maxLength: 2)
            dateBox(text: $month, placeholder: "MM", maxLength: 2)
            dateBox(text: $year, placeholder: "YYYY", maxLength: 4)
        }
    }
}
    // MARK: - Border Color Logic
private extension DOBInput {
            var borderColor: Color {
                let valid = DateValidator.isValid(day: day, month: month, year: year)
                
                if showErrors {
                    return valid ? .green : .red
                }
                if hasInteracted {
                    return valid ? .green : .red
                }
                return Color.gray.opacity(0.5)
            }
        }
// reusable dateBox
private extension DOBInput {
    func dateBox(text: Binding<String>, placeholder: String, maxLength: Int) -> some View {
        TextField(placeholder, text: Binding(
            get: { text.wrappedValue },
            set: { newValue in
                let filtered = newValue.filter { $0.isNumber }
                if filtered.count <= maxLength {
                    text.wrappedValue = filtered
                }
            }
        ))
        .keyboardType(.numberPad)
        .multilineTextAlignment(.center)
        .padding()
        .frame(height: 50)
        .frame(maxWidth: .infinity)
        .background(
        RoundedRectangle(cornerRadius: 8)
            .stroke(Color.gray.opacity(0.5))
        )
    }
}
struct DOBInput_Previews: PreviewProvider {
    static var previews: some View {
        DOBInput(day: .constant(""),
                 month: .constant(""),
                 year: .constant("")
        )
        .padding()
        .previewLayout(.sizeThatFits)
    }
}
