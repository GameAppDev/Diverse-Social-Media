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
}
