//
//  ApplicationConstants.swift
//  Diverse-Social-Media
//
//  Created by Oguzhan Yalcin on 4.09.2022.
//

import Foundation

class ApplicationConstants {
    
    static let baseUrl = "https://www...com"
    
    static let splashVC: StoryboardItem = StoryboardItem(storyboardName: "SplashViewController", storyboardIdentifier: "SplashVC")
    static let loginVC: StoryboardItem = StoryboardItem(storyboardName: "LoginViewController", storyboardIdentifier: "LoginVC")
}

struct StoryboardItem {
    let storyboardName: String
    let storyboardIdentifier: String
}
