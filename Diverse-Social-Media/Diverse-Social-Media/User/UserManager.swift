//
//  UserManager.swift
//  Diverse-Social-Media
//
//  Created by Oguzhan Yalcin on 21.08.2022.
//

import Foundation

class UserManager {
    
    static let shared = UserManager()
    
    private var userId: String?
    private var userType: UserType?
    private var firstName: String?
    private var lastName: String?
    private var email: String?
    private var characterPhoto: String?
    private var about: String?
    
    public var isGuest: Bool {
        return (self.userType ?? .Guest) == .Guest
    }
    
    private init() {}
    
    public func setUserModel(model:[String: Any]) -> Bool {
        guard
            let userType = model["userType"] as? UserType,
            let firstName = model["firstName"] as? String,
            let lastName = model["lastName"] as? String,
            let email = model["email"] as? String,
            let characterPhoto = model["characterPhoto"] as? String,
            let about = model["about"] as? String
        else {
            debugPrint("<---! User Model is not correct format !--->")
            return false
        }
        self.userId = createUserId()
        self.userType = userType
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.characterPhoto = characterPhoto
        self.about = about
        debugPrint("<--- User Model is ready --->")
        return true
    }
    
    private func createUserId() -> String {
        return NSUUID().uuidString
    }
    
    public func getFullName() -> String {
        return (self.firstName ?? "Name") + (self.lastName ?? "Surname")
    }
    
    public func getUserType() -> UserType {
        return self.userType ?? .Guest
    }
    
    public func deleteUser() {
        self.userId = nil
        self.userType = nil
        self.firstName = nil
        self.lastName = nil
        self.email = nil
        self.characterPhoto = nil
        self.about = nil
        debugPrint("<--- User Model is clean --->")
    }
}
