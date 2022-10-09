//
//  RegisterUserInfoPresenter.swift
//  Diverse-Social-Media
//
//  Created by Oguzhan Yalcin on 7.09.2022.
//

import Foundation

final class RegisterUserInfoPresenter {
    
    private weak var view: RegisterUserInfoViewController?
    private var interactor: RegisterUserInfoInteractor?
    private var router: RegisterUserInfoRouter?
    
    public let tfTitles: [String] = ["Email", "About You"]
    
    public var registerModel: [String: Any]?
    
    init(view: RegisterUserInfoViewController, interactor: RegisterUserInfoInteractor, router: RegisterUserInfoRouter, registerModel: [String: Any]) {
        self.view = view
        self.interactor = interactor
        self.router = router
        self.registerModel = registerModel
    }
}

extension RegisterUserInfoPresenter: PRegisterUserInfoViewToPresenter {
    
    func viewDidLoad() {
        view?.setupViews()
        view?.setupTableView()
    }
    
    func viewWillAppear() {
        view?.setNavBar()
    }
    
    func navigateToNext(registerModel: [String: Any]) {
        if let email = registerModel["email"] as? String, let about = registerModel["about"] as? String, let modelPrevious = self.registerModel {
            guard (email.isValidEmail()), (about != "") else {
                router?.showAlert(message: "Please enter valid email and tell about yourself.".localized)
                return
            }
            var model: [String: Any] = modelPrevious
            model["email"] = email
            model["about"] = about
            router?.openNextVC(registerModel: model)
        }
    }
}
