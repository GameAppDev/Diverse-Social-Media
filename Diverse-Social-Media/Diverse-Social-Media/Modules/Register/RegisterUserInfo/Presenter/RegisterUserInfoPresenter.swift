//
//  RegisterUserInfoPresenter.swift
//  Diverse-Social-Media
//
//  Created by Oguzhan Yalcin on 7.09.2022.
//

import Foundation

final class RegisterUserInfoPresenter {
    
    private var view: RegisterUserInfoViewController?
    private var interactor: RegisterUserInfoInteractor?
    private var router: RegisterUserInfoRouter?
    
    //Register Items
    public var userType: UserTypeItems?
    public var username: String?
    public var email: String?
    public var about: String?
    
    init(view: RegisterUserInfoViewController, interactor: RegisterUserInfoInteractor, router: RegisterUserInfoRouter, userType: UserTypeItems) {
        self.view = view
        self.interactor = interactor
        self.router = router
        self.userType = userType
    }
}

extension RegisterUserInfoPresenter: PRegisterUserInfoViewToPresenter {
    
    func viewDidLoad() {
        view?.setupViews()
    }
    
    func viewWillAppear() {
        view?.setNavBar()
    }
    
    func navigateToNext() {
        router?.openNextVC()
    }
}
