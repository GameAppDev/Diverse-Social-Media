//
//  UserCoreDataManager.swift
//  Diverse-Social-Media
//
//  Created by Oguzhan Yalcin on 12.01.2023.
//

import Foundation
import CoreData

final class UserCoreDataManager {
    
    public static let shared = UserCoreDataManager()
    
    public func isUserLoggedIn() -> Bool {
        return false
    }
}
