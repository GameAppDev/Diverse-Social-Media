//
//  Optional+Ext.swift
//  Diverse-Social-Media
//
//  Created by Oguzhan Yalcin on 15.01.2023.
//

import Foundation

extension Optional where Wrapped == String {
    
    var orEmpty: String {
        self ?? ""
    }
}

extension Optional where Wrapped == Int {
    
    var orEmpty: Int {
        self ?? 0
    }
}
