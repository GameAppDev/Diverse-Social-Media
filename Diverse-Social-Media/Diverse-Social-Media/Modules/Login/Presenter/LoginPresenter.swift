//
//  LoginPresenter.swift
//  Diverse-Social-Media
//
//  Created by Oguzhan Yalcin on 2.09.2022.
//

import Foundation

final class LoginPresenter {
    
    private weak var view: PLoginPresenterToView?
    private var interactor: PLoginPresenterToInteractor?
    private var router: PLoginPresenterToRouter?
    
    init(view: PLoginPresenterToView,
         interactor: PLoginPresenterToInteractor,
         router: PLoginPresenterToRouter) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension LoginPresenter: PLoginViewToPresenter {
    
    func startLoginProcess(loginModel: [String: Any]) {
        if let username = loginModel["username"] as? String, let password = loginModel["password"] as? String {
            guard username != "", password != "" else {
                view?.showWarningPopup(content: "Username or Password is not correct".localized)
                return
            }
            interactor?.fetchData(request: loginModel)
        }
    }
    
    // MARK: - PresenterToView
    func viewDidLoad() { }
    
    func viewWillAppear() {
        view?.setNavBar(title: "Login".localized)
    }
}

extension LoginPresenter: PLoginInteractorToPresenter {
    
    // MARK: - InteractorToPresenter
    func setData<T>(data: T) { }
    
    func setError(error: BaseError) { }
}
