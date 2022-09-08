//
//  StringExtension.swift
//  Diverse-Social-Media
//
//  Created by Oguzhan Yalcin on 4.09.2022.
//

import Foundation

extension String {
    
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
    
    var returnWithMargin: String {
        return "  \(self)  "
    }
    
    var languageLongName: String {
        switch self {
        case "en": return "English"
        case "de": return "Deutsch"
        case "tr": return "Turkce"
        default: return "English"
        }
    }
    
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: self)
    }
}
