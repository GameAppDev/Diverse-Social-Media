//
//  RegisterUsernamePasswordContractor.swift
//  Diverse-Social-Media
//
//  Created by Oguzhan Yalcin on 7.09.2022.
//

import Foundation

protocol PRegisterUsernamePasswordViewToPresenter {
    
    func viewDidLoad()
    
    func viewWillAppear()
    
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

protocol PRegisterUsernamePasswordPresenterToRouter {
    
    func openHomeVC(registerModel: [String: Any])
    
    func showPopup(message: String)
}
