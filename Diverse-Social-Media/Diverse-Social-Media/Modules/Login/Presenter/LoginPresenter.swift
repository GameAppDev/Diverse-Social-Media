//
//  LoginPresenter.swift
//  Diverse-Social-Media
//
//  Created by Oguzhan Yalcin on 2.09.2022.
//

import Foundation

final class LoginPresenter {
    
    private weak var view: LoginViewController?
    private var interactor: LoginInteractor?
    private var router: LoginRouter?
    
    public let tfTitles: [String] = ["Username", "Password"]
    
    init(view: LoginViewController,
         interactor: LoginInteractor,
         router: LoginRouter) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension LoginPresenter: PLoginViewToPresenter {
    
    func viewDidLoad() {
        //view?.indicatorView(animate: true)
        view?.setupViews()
        view?.setupTableView()
    }
    
    func viewWillAppear() {
        view?.setNavBar()
    }
    
    func startLoginProcess(loginModel: [String: Any]) {
        if let username = loginModel["username"] as? String, let password = loginModel["password"] as? String {
            guard username != "", password != "" else {
                router?.showAlert(message: "Username or Password is not correct".localized)
                return
            }
            interactor?.fetchUserData(loginModel: loginModel)
        }
    }
}

extension LoginPresenter: PLoginInteractorToPresenter {
    
    func setData<T>(data: T) { }
    
    func setError(error: BaseError) { }
    
    func onSuccessLogin(response: User) {
        //view?.indicatorView(animate: false)
        router?.userLoggedIn()
    }
    
    func onErrorLogin(error: BaseError) {
        //view?.indicatorView(animate: false)
        router?.showAlert(message: error.errorMessage ?? "Please try again".localized)
    }
}
