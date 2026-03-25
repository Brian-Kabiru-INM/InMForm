//
//  AppPrimaryButton.swift
//  InMForm
//
//  Created by Brian Kabiru on 24/03/2026.
//

import SwiftUI

struct AppPrimaryButton: View {
    // properties
    let title: String
    let action: () -> Void
    var isEnabled: Bool = true
    let cyanGreen = Color(red: 0, green: 0.7, blue: 0.7)
    
    // body
    var body: some View {
        Button(action: {
            if isEnabled {
                action()
            }
        }) {
            Text(title)
                .font(.headline)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .frame(height: 50)
                .background(isEnabled ? cyanGreen : Color.gray.opacity(0.5))
                .cornerRadius(30)
                .animation(.easeInOut(duration: 0.2), value: isEnabled)
        }
        .disabled(!isEnabled)
    }
}
// preview
struct AppPrimaryButton_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 20) {
            AppPrimaryButton(title: "Continue",
                             action: {},
            isEnabled: true)
            AppPrimaryButton(title: "Continue",
                             action: {},
            isEnabled: false)
        }
        .padding()
        .previewLayout(.sizeThatFits)
    }
}
