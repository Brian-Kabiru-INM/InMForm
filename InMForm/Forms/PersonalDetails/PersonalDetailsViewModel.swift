//
//  PersonalDetailsViewModel.swift
//  InMForm
//
//  Created by Brian Kabiru on 24/03/2026.
//

import SwiftUI
import Combine

class PersonalDetailsViewModel: ObservableObject {
    // form fields
    @Published var salutation: String = ""
    @Published var gender: String = ""
    @Published var firstName: String = ""
    @Published var surName: String = ""
    @Published var day: String = ""
    @Published var month: String = ""
    @Published var year: String = ""
    @Published var nationalID: String = ""
    @Published var email: String = ""
    @Published var phone: String = ""
    
    let salutationOptions = ["Mr", "Mrs", "Ms", "Dr"]
    
    @Published var isFirstNameValid: Bool? = nil
    @Published var isSurNameValid: Bool? = nil
    @Published var isDOBValid: Bool? = nil
    @Published var isNationalIDValid: Bool? = nil
    @Published var isEmailValid: Bool? = nil
    @Published var isPhoneValid: Bool? = nil
    @Published var showErrors: Bool = false
    
    var isFormValid: Bool {
        return
        !salutation.isEmpty &&
        !gender.isEmpty &&
        (isFirstNameValid ?? false) &&
        (isSurNameValid ?? false) &&
        (isDOBValid ?? false) &&
        (isNationalIDValid ?? false) &&
        (isEmailValid ?? false) &&
        (isPhoneValid ?? false)
    }
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        setupValidationPipelines()
    }
}

// validationlogic
extension PersonalDetailsViewModel {
    func setupValidationPipelines() {
        // firstname
        $firstName
            .map { NameValidator.isValid($0) }
            .receive(on: RunLoop.main)
            .assign(to: &$isFirstNameValid)
        // surname
        $surName
            .map { NameValidator.isValid($0) }
            .receive(on: RunLoop.main)
            .assign(to: &$isSurNameValid)
        // DOB
        Publishers.CombineLatest3($day, $month, $year)
            .map { day, month, year in
                DateValidator.isValid(day: day, month: month, year: year)
            }
            .receive(on: RunLoop.main)
            .assign(to: &$isDOBValid)
        //NationalID
        $nationalID
            .map { IDValidator.isValid($0) }
            .receive(on: RunLoop.main)
            .assign(to: &$isNationalIDValid)
        // Email
        $email
            .map { EmailValidator.isValid($0) }
            .receive(on: RunLoop.main)
            .assign(to: &$isEmailValid)
        
        // phone
        $phone
            .map { PhoneValidator.isValid($0) }
            .receive(on: RunLoop.main)
            .assign(to: &$isPhoneValid)
    }
}

extension PersonalDetailsViewModel {
    func onContinue() {
        showErrors = true
        let model = PersonalDetailsModel()
    }
}
