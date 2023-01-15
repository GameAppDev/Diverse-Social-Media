//
//  Validatable.swift
//  Diverse-Social-Media
//
//  Created by Oguzhan Yalcin on 12.01.2023.
//

import UIKit

protocol Validatable: BaseInput {
    func validations() -> [Validation]
}

extension Validatable {
    
    func isValid() -> Bool {
        return self.validations().filter {( $0.validate(self.baseText.orEmpty) == false )}.isEmpty
    }
}

struct Validation {
    let validate: (String) -> Bool

    init(validate: @escaping (String) -> Bool) {
        self.validate = validate
    }
}
