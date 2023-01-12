//
//  SplashPresenter.swift
//  Diverse-Social-Media
//
//  Created by Oguzhan Yalcin on 2.09.2022.
//

import UIKit

final class SplashPresenter {
    
    private weak var view: PSplashPresenterToView?
    private var router: PSplashPresenterToRouter?
    
    init(view: PSplashPresenterToView,
         router: PSplashPresenterToRouter) {
        self.view = view
        self.router = router
    }
}

extension SplashPresenter: PSplashViewToPresenter {
    
    func handleLogin() {
        router?.navigateToLogin()
    }
    
    func handleRegister() {
        router?.navigateToRegister()
    }
    
    func handleLanguagePicker() { }
    
    // MARK: - PresenterToView
    func viewDidLoad() {
        view?.setTitle(text: "Welcome to Diverse Social Media Application".localized)
        view?.setTitle(font: UIFont.titleFont)
        view?.setTitle(colour: UIColor.titleColour)
        view?.setLoginButton(title: "Login".localized.returnWithMargin)
        view?.setLoginButton(font: UIFont.buttonTitleFont)
        view?.setLoginButton(bgColour: UIColor.buttonBGColour, titleColour: UIColor.buttonTitleColour)
        view?.setLoginButton(roundCornersSize: CGFloat(10).ws)
        view?.setRegisterButton(title: "Register".localized.returnWithMargin)
        view?.setRegisterButton(font: UIFont.buttonTitleFont)
        view?.setRegisterButton(bgColour: UIColor.buttonBGColour, titleColour: UIColor.buttonTitleColour)
        view?.setRegisterButton(roundCornersSize: CGFloat(10).ws)
        // TODO: - set language
        let language: String = "English"
        view?.setLanguageImageView(image: language)
        view?.setLanguageTextField(text: language)
        view?.setLanguageTextField(font: UIFont.textFont)
        view?.setLanguageTextField(textColour: UIColor.textColour, tintColor: UIColor.clear)
        view?.setPickerView()
    }
    
    func viewWillAppear() {
        view?.setNavBar(title: "")
    }
}
