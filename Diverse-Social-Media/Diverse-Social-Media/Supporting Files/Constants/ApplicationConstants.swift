//
//  ApplicationConstants.swift
//  Diverse-Social-Media
//
//  Created by Oguzhan Yalcin on 4.09.2022.
//

import Foundation

final class ApplicationConstants {
    
    static let baseUrl = "https://www.text-diverse-social-media.com"
    
    static let splashVC: StoryboardItem = StoryboardItem(storyboardName: "Splash", storyboardIdentifier: "SplashVC")
    static let loginVC: StoryboardItem = StoryboardItem(storyboardName: "Login", storyboardIdentifier: "LoginVC")
    static let registerUserTypeVC: StoryboardItem = StoryboardItem(storyboardName: "RegisterUserType", storyboardIdentifier: "RegisterUserTypeVC")
    static let registerUserInfoVC: StoryboardItem = StoryboardItem(storyboardName: "RegisterUserInfo", storyboardIdentifier: "RegisterUserInfoVC")
    static let registerUsernamePasswordVC: StoryboardItem = StoryboardItem(storyboardName: "RegisterUsernamePassword", storyboardIdentifier: "RegisterUsernamePasswordVC")
}

struct StoryboardItem {
    let storyboardName: String
    let storyboardIdentifier: String
}
