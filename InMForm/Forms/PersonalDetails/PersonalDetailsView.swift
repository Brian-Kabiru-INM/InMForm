//
//  PersonalDetailsView.swift
//  InMForm
//
//  Created by Brian Kabiru on 24/03/2026.
//

import SwiftUI

struct PersonalDetailsView: View {
    @StateObject private var viewModel = PersonalDetailsViewModel()
    let colorBlue = Color(red: 0, green: 0.1, blue: 0.8)
    let colorCyan = Color(red: 0, green: 0.8, blue: 0.7)
    var body: some View {
        ZStack(alignment: .top) {
            // Header Background
            LinearGradient(
                gradient: Gradient(colors: [colorBlue, colorCyan]),
                startPoint: .leading,
                endPoint: .trailing
            )
            .frame(height: 800)
            .edgesIgnoringSafeArea(.top)
            
            VStack(spacing: 0) {
                // Header Content
                headerSection
                // Form Card Container
                formContainer
            }
        }
    }
}
// MARK: - Header Section
private extension PersonalDetailsView {
    var headerSection: some View {
        VStack(alignment: .leading, spacing: 14) {
            Text("Personal details")
                .font(.headline)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .center)
            ProgressView(value: 0.25)
                .tint(.white)
                .background(colorBlue)
                .frame(maxWidth: UIScreen.main.bounds.width * 0.9, alignment: .leading)
                .clipShape(Capsule())
            Text("Let's Get Started")
                .font(.title2.bold())
                .foregroundColor(.white)
        }
        .padding(.horizontal)
        .padding(.top, 30)
    }
}
// MARK: - Form Container
private extension PersonalDetailsView {
    var formContainer: some View {
        VStack {
            ScrollView(showsIndicators: false) {
                VStack(spacing: 20) {
                    // Form
                    PersonalDetailsForm(viewModel: viewModel)
                }
                .padding()
            }
            .frame(maxWidth: .infinity)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            RoundedRectangle(cornerRadius: 24)
                .fill(Color.white)
                .edgesIgnoringSafeArea(.bottom)
        )
        .padding(.top, 20)
    }
}
#Preview {
    PersonalDetailsView()
}
