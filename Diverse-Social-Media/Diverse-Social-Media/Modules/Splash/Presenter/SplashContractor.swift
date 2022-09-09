//
//  SplashContractor.swift
//  Diverse-Social-Media
//
//  Created by Oguzhan Yalcin on 4.09.2022.
//

import Foundation

protocol PSplashPresenterToView: PresenterToView {
    
    func setLanguage(language: String)
    
    func setGestureRecognizerForLanguage()
    
    func setupPicker()
    
    func becomeFirstResponderLanguageTextField()
    
    func resignFirstResponderLanguageTextField()
}

protocol PSplashViewToPresenter: ViewToPresenter {
    
    func navigateToLogin()
    
    func navigateToRegister()
    
    func openLanguagePicker()
    
    func selectLanguageFromPicker(index: Int)
}

protocol PSplashPresenterToInteractor {
    
    func fetchConfigData()
}

protocol PSplashInteractorToPresenter {
    
    func onSuccessConfig(response: Config)
    
    func onErrorConfig(error: BaseError)
}

protocol PSplashPresenterToRouter {
   
    func openLoginVC()
    
    func openRegisterVC()
}
