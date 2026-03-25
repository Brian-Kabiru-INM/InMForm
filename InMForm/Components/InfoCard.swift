//
//  InfoCard.swift
//  InMForm
//
//  Created by Brian Kabiru on 24/03/2026.
//

import SwiftUI

struct InfoCard: View {
    // properties
    let icon: String
    let message: String
    
    // body
    var body: some View {
        HStack(alignment: .center, spacing: 12) {
            Image(systemName: icon)
                .font(.system(size: 20))
                .foregroundColor(.blue)
                .padding(.top, 4)
                // .frame(alignment: .center)
            Text(message)
                .font(.subheadline)
                .foregroundColor(.blue)
            Spacer()
        }
        .padding()
        .background(Color.blue.opacity(0.1))
        .cornerRadius(12)
    }
}
// preview
struct InfoCard_previews: PreviewProvider {
    static var previews: some View {
        InfoCard(icon: "exclamationmark.circle.fill",
                 message: "Once you continue a  One-Time Password (OTP) will be sent to both your email and mobile number. Please ensure the details provided are correct.")
        .padding()
        .previewLayout(.sizeThatFits)
    }
}
