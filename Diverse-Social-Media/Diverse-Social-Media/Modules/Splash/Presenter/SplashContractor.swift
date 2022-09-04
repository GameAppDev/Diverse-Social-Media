//
//  SplashContractor.swift
//  Diverse-Social-Media
//
//  Created by Oguzhan Yalcin on 4.09.2022.
//

import Foundation

protocol PSplashViewToPresenter {
    func viewDidLoad()
    func viewWillAppear()
    func navigateToLogin()
    func navigateToRegister()
    func openLanguagePicker()
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
