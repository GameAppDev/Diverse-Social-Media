//
//  ApplicationConstants.swift
//  Diverse-Social-Media
//
//  Created by Oguzhan Yalcin on 4.09.2022.
//

import Foundation

class ApplicationConstants {
    
    static let baseUrl = "https://www...com"
    
    static let splashVC: StoryboardItem = StoryboardItem(storyboardName: "Splash", storyboardIdentifier: "SplashVC")
    static let loginVC: StoryboardItem = StoryboardItem(storyboardName: "Login", storyboardIdentifier: "LoginVC")
    static let registerUserTypeVC: StoryboardItem = StoryboardItem(storyboardName: "RegisterUserType", storyboardIdentifier: "RegisterUserTypeVC")
}

struct StoryboardItem {
    let storyboardName: String
    let storyboardIdentifier: String
}
