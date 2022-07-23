//
//  PhoneNumberValidation.swift
//  Pokedex
//
//  Created by Thaisa Fujii on 22/07/22.
// MOBLE NUMBER FORMATING

import Foundation

extension String {
    
    func isValidPhoneNumber() -> Bool {
        let regEx = "^\\+(?:[0-9]?){6,14}[0-9]$"

        let phoneCheck = NSPredicate(format: "SELF MATCHES[c] %@", regEx)
        return phoneCheck.evaluate(with: self)
    }
}
