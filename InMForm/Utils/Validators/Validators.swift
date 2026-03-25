//
//  Validators.swift
//  InMForm
//
//  Created by Brian Kabiru on 24/03/2026.
//

import Foundation

enum NameValidator {
    static func isValid(_ name: String) -> Bool {
        guard !name.isEmpty else { return false }
        let regex = "^[A-Za-z ]+$"
        return NSPredicate(format: "SELF MATCHES %@", regex)
            .evaluate(with: name)
    }
}

enum EmailValidator {
    static func isValid(_ email: String) -> Bool {
        guard !email.isEmpty else { return false }
        let regex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        return NSPredicate(format: "SELF MATCHES %@", regex)
            .evaluate(with: email)
    }
}

enum PhoneValidator {
    static func isValid(_ phone: String) -> Bool {
        let regex = "^[0-9]{9}$"
        return NSPredicate(format: "SELF MATCHES %@", regex)
            .evaluate(with: phone)
    }
}

enum DateValidator {
    static func isValid(day: String, month: String, year: String) -> Bool {
        guard
            let day = Int(day),
            let month = Int(month),
            let year = Int(year)
        else { return false }
        
        guard (1...31).contains(day),
              (1...12).contains(month),
              (1900...2026).contains(year)
        else { return false }
        
        let dateString = "\(day)-\(month)-\(year)"
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy"
        return formatter.date(from: dateString) != nil
    }
}

enum IDValidator {
    static func isValid(_ id: String) -> Bool {
        let regex = "^[0-9]{7,8}$"
        return NSPredicate(format: "SELF MATCHES%@", regex)
            .evaluate(with: id)
    }
}
