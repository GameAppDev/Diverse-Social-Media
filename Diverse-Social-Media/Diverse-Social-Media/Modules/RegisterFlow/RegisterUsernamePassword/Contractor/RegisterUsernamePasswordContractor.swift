//
//  RegisterUsernamePasswordContractor.swift
//  Diverse-Social-Media
//
//  Created by Oguzhan Yalcin on 7.09.2022.
//

import Foundation

protocol PRegisterUsernamePasswordPresenterToView: PresenterToView {
    
    func setupTableView()
}

protocol PRegisterUsernamePasswordViewToPresenter: ViewToPresenter {
    
    func navigateToNext(registerModel: [String: Any])
}

protocol PRegisterUsernamePasswordPresenterToInteractor {
    
    func checkUsernameExists(registerModel: [String: Any])
    
    func setRegisterDataToCoreData(registerModel: [String: Any])
    
    func setUserManager(registerModel: [String: Any])
}

protocol PRegisterUsernamePasswordInteractorToPresenter {
    
    func onSuccessUsernameExists(registerModel: [String: Any])
    
    func onErrorUsernameExists()
    
    func onSuccessCoreData(registerModel: [String: Any])
    
    func onErrorCoreData()
    
    func onSuccessUserManager()
    
    func onErrorUserManager()
}

protocol PRegisterUsernamePasswordPresenterToRouter: PresenterToRouter {
    
    func openHomeVC(registerModel: [String: Any])
}
