//
//  ApplicationConstants.swift
//  Diverse-Social-Media
//
//  Created by Oguzhan Yalcin on 4.09.2022.
//

import Foundation

final class ApplicationConstants {
    
    static let baseUrl = "https://www.text-diverse-social-media.com"
    
    static let splashVC: NibItem = NibItem(nibName: SplashViewController.className)
    static let loginVC: NibItem = NibItem(nibName: LoginViewController.className)
    static let registerUserTypeVC: NibItem = NibItem(nibName: RegisterUserTypeViewController.className)
    static let registerUserInfoVC: NibItem = NibItem(nibName: RegisterUserInfoViewController.className)
    static let registerUsernamePasswordVC: NibItem = NibItem(nibName: RegisterUsernamePasswordViewController.className)
}

struct NibItem {
    let nibName: String
}
