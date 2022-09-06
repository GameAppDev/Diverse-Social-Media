//
//  LoginPresenter.swift
//  Diverse-Social-Media
//
//  Created by Oguzhan Yalcin on 2.09.2022.
//

import Foundation

final class LoginPresenter {
    
    private var view: LoginViewController?
    private var interactor: LoginInteractor?
    private var router: LoginRouter?
    
    init(view: LoginViewController, interactor: LoginInteractor, router: LoginRouter) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension LoginPresenter: PLoginViewToPresenter {
    
    func viewDidLoad() {
        //view?.indicatorView(animate: true)
        view?.setupViews()
    }
    
    func viewWillAppear() {
        view?.setNavBar()
    }
    
    func startLoginProcess(username: String, password: String) {
        guard username != "", password != "" else {
            router?.showPopup(message: "Username or Password is not correct")
            return
        }
        interactor?.fetchUserData(username: username, password: password)
    }
}

extension LoginPresenter: PLoginInteractorToPresenter {
    
    func onSuccessLogin(response: User) {
        //view?.indicatorView(animate: false)
        router?.userLoggedIn()
    }
    
    func onErrorLogin(error: BaseError) {
        //view?.indicatorView(animate: false)
        router?.showPopup(message: error.errorMessage ?? "Please try again".localized)
    }
}
