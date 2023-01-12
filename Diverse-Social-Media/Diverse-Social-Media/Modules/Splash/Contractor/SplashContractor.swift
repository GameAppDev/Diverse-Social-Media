//
//  SplashContractor.swift
//  Diverse-Social-Media
//
//  Created by Oguzhan Yalcin on 4.09.2022.
//

import UIKit

protocol PSplashPresenterToView: PresenterToView {
    func setNavBar(title: String)
    func setTitle(text: String)
    func setTitle(font: UIFont)
    func setTitle(colour: UIColor)
    func setLoginButton(title: String)
    func setLoginButton(font: UIFont)
    func setLoginButton(bgColour: UIColor, titleColour: UIColor)
    func setLoginButton(roundCornersSize: CGFloat)
    func setRegisterButton(title: String)
    func setRegisterButton(font: UIFont)
    func setRegisterButton(bgColour: UIColor, titleColour: UIColor)
    func setRegisterButton(roundCornersSize: CGFloat)
    func setLanguageImageView(image: String)
    func setLanguageTextField(text: String)
    func setLanguageTextField(font: UIFont)
    func setLanguageTextField(textColour: UIColor, tintColor: UIColor)
    func setPickerView()
}

protocol PSplashViewToPresenter: ViewToPresenter {
    func handleLogin()
    func handleRegister()
    func handleLanguagePicker()
}

protocol PSplashPresenterToRouter: PresenterToRouter {
    func navigateToLogin()
    func navigateToRegister()
}
