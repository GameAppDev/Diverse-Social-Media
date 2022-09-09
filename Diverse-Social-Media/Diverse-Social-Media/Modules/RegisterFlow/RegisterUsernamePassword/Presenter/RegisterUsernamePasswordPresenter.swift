//
//  RegisterUsernamePasswordPresenter.swift
//  Diverse-Social-Media
//
//  Created by Oguzhan Yalcin on 7.09.2022.
//

import Foundation

final class RegisterUsernamePasswordPresenter {
    
    private var view: RegisterUsernamePasswordViewController?
    private var interactor: RegisterUsernamePasswordInteractor?
    private var router: RegisterUsernamePasswordRouter?
    
    public var registerModel: [String: Any]?
    
    let tfTitles: [String] = ["Username", "Password"]
    
    init(view: RegisterUsernamePasswordViewController, interactor: RegisterUsernamePasswordInteractor, router: RegisterUsernamePasswordRouter, registerModel: [String: Any]) {
        self.view = view
        self.interactor = interactor
        self.router = router
        self.registerModel = registerModel
    }
}

extension RegisterUsernamePasswordPresenter: PRegisterUsernamePasswordViewToPresenter {
    
    func viewDidLoad() {
        view?.setupViews()
        view?.setupTableView()
    }
    
    func viewWillAppear() {
        view?.setNavBar()
    }
    
    func navigateToNext(registerModel: [String: Any]) {
        if let username = registerModel["username"] as? String, let password = registerModel["password"] as? String, let modelPrevious = self.registerModel {
            guard (username != ""), (password != "") else {
                router?.showAlert(message: "Please enter username and password.".localized)
                return
            }
            //view?.indicatorView(animate: true)
            interactor?.apiState = .loading
            
            var model: [String: Any] = modelPrevious
            model["username"] = username
            model["password"] = password
            interactor?.checkUsernameExists(registerModel: model)
        }
    }
}

extension RegisterUsernamePasswordPresenter: PRegisterUsernamePasswordInteractorToPresenter {
    
    func onSuccessUsernameExists(registerModel: [String: Any]) {
        interactor?.setRegisterDataToCoreData(registerModel: registerModel)
    }
    
    func onErrorUsernameExists() {
        //view?.indicatorView(animate: false)
        interactor?.apiState = .failure
        router?.showAlert(message: "Username is already exists".localized)
    }
    
    func onSuccessCoreData(registerModel: [String: Any]) {
        interactor?.setUserManager(registerModel: registerModel)
    }
    
    func onErrorCoreData() {
        //view?.indicatorView(animate: false)
        interactor?.apiState = .failure
        router?.showAlert(message: "User data could not saved to Core Data".localized)
    }
    
    func onSuccessUserManager() {
        //view?.indicatorView(animate: false)
        interactor?.apiState = .success
    }
    
    func onErrorUserManager() {
        //view?.indicatorView(animate: false)
        interactor?.apiState = .failure
        router?.showAlert(message: "Please try to login".localized)
    }
}
