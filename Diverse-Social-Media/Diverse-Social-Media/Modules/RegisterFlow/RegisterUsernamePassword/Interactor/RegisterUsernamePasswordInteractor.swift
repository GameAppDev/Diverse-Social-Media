//
//  RegisterUsernamePasswordInteractor.swift
//  Diverse-Social-Media
//
//  Created by Oguzhan Yalcin on 7.09.2022.
//

import Foundation

final class RegisterUsernamePasswordInteractor: Interactorable {
    
    private var networkManager: Networkable?
    public var presenter: RegisterUsernamePasswordPresenter?
    
    public var apiState: ApiState = .beforeRequest
    
    private var userDefaults = UserDefaults.standard
    
    private func setLoggedInToUserDefaults() {
        userDefaults.set("1", forKey: "LANGUAGE")
        userDefaults.synchronize()
    }
}

extension RegisterUsernamePasswordInteractor: PRegisterUsernamePasswordPresenterToInteractor {
    
    func checkUsernameExists(registerModel: [String: Any]) {
        presenter?.onSuccessUsernameExists(registerModel: registerModel)
    }
    
    func setRegisterDataToCoreData(registerModel: [String : Any]) {
        presenter?.onSuccessCoreData(registerModel: registerModel)
    }
    
    func setUserManager(registerModel: [String : Any]) {
        let isSetUser: Bool = UserManager.shared.setUserModel(model: registerModel)
        if isSetUser {
            setLoggedInToUserDefaults()
            presenter?.onSuccessUserManager()
        }
        else {
            presenter?.onErrorUserManager()
        }
    }
}
