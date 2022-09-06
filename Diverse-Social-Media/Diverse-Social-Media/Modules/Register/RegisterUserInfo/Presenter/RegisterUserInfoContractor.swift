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
    func navigateToNext()
}

protocol PRegisterUserInfoPresenterToRouter {
    func openNextVC()
}
