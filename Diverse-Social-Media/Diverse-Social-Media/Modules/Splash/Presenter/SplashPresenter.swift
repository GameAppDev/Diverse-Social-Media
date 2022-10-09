//
//  SplashPresenter.swift
//  Diverse-Social-Media
//
//  Created by Oguzhan Yalcin on 2.09.2022.
//

import Foundation

final class SplashPresenter {
    
    private weak var view: SplashViewController?
    private var interactor: SplashInteractor?
    private var router: SplashRouter?
    
    public var languages: [String] = ApplicationConstants.languages
    
    init(view: SplashViewController, interactor: SplashInteractor, router: SplashRouter) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension SplashPresenter: PSplashViewToPresenter {
    
    func viewDidLoad() {
        //view?.indicatorView(animate: true)
        view?.setupViews()
        view?.setGestureRecognizerForLanguage()
        interactor?.apiState = .loading
        interactor?.fetchConfigData()
    }
    
    func viewWillAppear() {
        if let lang = interactor?.getUserDefaultsStringValueOf("LANGUAGE") {
            view?.setLanguage(language: lang)
        }
        view?.setNavBar()
    }
    
    func navigateToLogin() {
        router?.openLoginVC()
    }
    
    func navigateToRegister() {
        router?.openRegisterVC()
    }
    
    func openLanguagePicker() {
        view?.setupPicker()
        view?.becomeFirstResponderLanguageTextField()
    }
    
    func selectLanguageFromPicker(index: Int) {
        view?.resignFirstResponderLanguageTextField()
        if let lang = languages[safe: index] {
            appDelegate.setLanguage(language: lang)
        }
    }
}

extension SplashPresenter: PSplashInteractorToPresenter {
    
    func onSuccessConfig(response: Config) {
        //view?.indicatorView(animate: false)
        interactor?.apiState = .success
    }
    
    func onErrorConfig(error: BaseError) {
        //view?.indicatorView(animate: false)
        interactor?.apiState = .failure
    }
}
