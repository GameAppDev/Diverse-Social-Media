//
//  ApplicationConstants.swift
//  Diverse-Social-Media
//
//  Created by Oguzhan Yalcin on 4.09.2022.
//

import Foundation

class ApplicationConstants {
    
    static let baseUrl = "https://www...com"
    
    static let rootVC: StoryboardItem = StoryboardItem(storyboardName: "Main", storyboardIdentifier: "RootVC")
    static let splashVC: StoryboardItem = StoryboardItem(storyboardName: "Splash", storyboardIdentifier: "SplashVC")
    static let loginVC: StoryboardItem = StoryboardItem(storyboardName: "Login", storyboardIdentifier: "LoginVC")
}

struct StoryboardItem {
    let storyboardName: String
    let storyboardIdentifier: String
}
