//
//  NSObjectExtension.swift
//  Diverse-Social-Media
//
//  Created by Oguzhan Yalcin on 2.09.2022.
//

import Foundation

extension NSObject {
    
    class var className: String {
        return String(describing: self)
    }
}
