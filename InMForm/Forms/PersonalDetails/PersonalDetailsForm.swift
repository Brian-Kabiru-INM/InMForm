//
//  PersonalDetailsForm.swift
//  InMForm
//
//  Created by Brian Kabiru on 24/03/2026.
//

import SwiftUI

struct PersonalDetailsForm: View {
    @ObservedObject var viewModel: PersonalDetailsViewModel
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            // salutation
            VStack(alignment: .leading, spacing: 8) {
                Text("Salutation / Title")
                    .font(.subheadline)
                DropdownField(placeholder: "Please select a salutation", options: viewModel.salutationOptions, selection: $viewModel.salutation)
                if viewModel.showErrors && viewModel.salutation.isEmpty {
                    Text("Salutation selection is required")
                        .font(.caption)
                        .foregroundColor(.red)
                }
            }
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Text("Gender ")
                        .font(.subheadline)
                        .foregroundColor(.primary)
                    +
                    Text("(As Per ID)")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                RadioSelector(options: ["Male", "Female"], selected: $viewModel.gender
                )
                if viewModel.showErrors && viewModel.gender.isEmpty {
                    Text("Gender selection is required")
                        .font(.caption)
                        .foregroundColor(.red)
                }
            }
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Text("First and Middle Name ")
                        .font(.subheadline)
                        .foregroundColor(.primary)
                    +
                    Text("(As Per ID)")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                AppTextField(placeholder: "", 
                             text: $viewModel.firstName,
                             keyboardType: .default,
                             isValid: viewModel.isFirstNameValid,
                             showErrors: viewModel.showErrors
                )
                if viewModel.showErrors && viewModel.firstName.isEmpty {
                    Text("First and middle name(s) are required")
                        .font(.caption)
                        .foregroundColor(.red)
                }
            }
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Text("Surname ")
                        .font(.subheadline)
                        .foregroundColor(.primary)
                    +
                    Text("(As Per ID)")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                AppTextField(placeholder: "", text: $viewModel.surName,
                             keyboardType: .default,
                             isValid: viewModel.isSurNameValid,
                             showErrors: viewModel.showErrors
                )
                if viewModel.showErrors && viewModel.surName.isEmpty {
                    Text("Surname is required")
                        .font(.caption)
                        .foregroundColor(.red)
                }
            }
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Text("Date of Birth ")
                        .font(.subheadline)
                        .foregroundColor(.primary)
                    +
                    Text("(As Per ID)")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                DOBInput(day: $viewModel.day,
                         month: $viewModel.month,
                         year: $viewModel.year
                )
                if viewModel.showErrors && !(viewModel.isDOBValid ?? true) {
                    Text("Date of birth is required")
                        .font(.caption)
                        .foregroundColor(.red)
                }
            }
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Text("National ID ")
                        .font(.subheadline)
                        .foregroundColor(.primary)
                    +
                    Text("(As Per ID)")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                AppTextField(placeholder: "", text: $viewModel.nationalID,
                             keyboardType: .numberPad,
                             isValid: viewModel.isNationalIDValid,
                             showErrors: viewModel.showErrors
                )
                if viewModel.showErrors && viewModel.nationalID.isEmpty {
                    Text("National ID is required")
                        .font(.caption)
                        .foregroundColor(.red)
                }
            }
            VStack(alignment: .leading, spacing: 8) {
                Text("Email Address")
                    .font(.subheadline)
                AppTextField(placeholder: "",
                             text: $viewModel.email,
                             keyboardType: .emailAddress,
                             isValid: viewModel.isEmailValid,
                             showErrors: viewModel.showErrors
                )
                if viewModel.showErrors && viewModel.email.isEmpty {
                    Text("Email Address is required")
                        .font(.caption)
                        .foregroundColor(.red)
                }
            }
            VStack(alignment: .leading, spacing: 8) {
                Text("Phone Number")
                    .font(.subheadline)
                HStack(spacing: 12) {
                    Text("+254")
                        .frame(width: 70, height: 50)
                        .background(Color.gray.opacity(0.15))
                        .cornerRadius(8)
                    AppTextField(placeholder: "",
                                 text: $viewModel.phone,
                                 keyboardType: .namePhonePad,
                                 isValid: viewModel.isPhoneValid,
                                 showErrors: viewModel.showErrors
                    )
                    }
                if viewModel.showErrors && viewModel.phone.isEmpty {
                    Text("Phone number is required")
                        .font(.caption)
                        .foregroundColor(.red)
                }
            }
            // info card
            InfoCard(icon: "exclamationmark.circle.fill", message: """
                     Once you continue a  One-Time Password (OTP) will be sent to both your email and mobile number. Please ensure the details provided are correct.
                     """
            )
            // continue Button
            AppPrimaryButton(title: "Continue", action: {
                viewModel.onContinue()
            },
                             isEnabled: viewModel.showErrors ? viewModel.isFormValid : true,
                             // isEnabled: !viewModel.isLoading,
                             isLoading: viewModel.isLoading
            )
            .padding(.top, 12)
        }
    }
}
// Preview
struct PersonalDetailsForm_previes: PreviewProvider {
    static var previews: some View {
        PersonalDetailsForm(viewModel: PersonalDetailsViewModel())
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
