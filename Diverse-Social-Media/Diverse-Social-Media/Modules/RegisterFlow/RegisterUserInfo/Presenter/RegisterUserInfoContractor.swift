//
//  RegisterUserInfoContractor.swift
//  Diverse-Social-Media
//
//  Created by Oguzhan Yalcin on 7.09.2022.
//

import Foundation

protocol PRegisterUserInfoViewToPresenter {
    
    func viewDidLoad()
    
    func viewWillAppear()
    
    func navigateToNext(registerModel: [String: Any])
}

protocol PRegisterUserInfoPresenterToRouter {
    
    func openNextVC(registerModel: [String: Any])
    
    func showPopup(message: String)
}
