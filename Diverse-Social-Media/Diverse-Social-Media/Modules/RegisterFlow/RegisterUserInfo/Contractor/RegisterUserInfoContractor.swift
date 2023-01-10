//
//  RegisterUserInfoContractor.swift
//  Diverse-Social-Media
//
//  Created by Oguzhan Yalcin on 7.09.2022.
//

import Foundation

protocol PRegisterUserInfoPresenterToView: PresenterToView {
    func setupTableView()
}

protocol PRegisterUserInfoViewToPresenter: ViewToPresenter {
    func navigateToNext(registerModel: [String: Any])
}

protocol PRegisterUserInfoPresenterToRouter: PresenterToRouter {
    func openNextVC(registerModel: [String: Any])
}
