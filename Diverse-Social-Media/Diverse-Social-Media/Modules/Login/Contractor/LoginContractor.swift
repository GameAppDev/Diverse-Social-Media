//
//  LoginContractor.swift
//  Diverse-Social-Media
//
//  Created by Oguzhan Yalcin on 4.09.2022.
//

import Foundation

protocol PLoginPresenterToView: PresenterToView {
    func setNavBar(title: String)
    func showWarningPopup(content: String)
}

protocol PLoginViewToPresenter: ViewToPresenter {
    func startLoginProcess(loginModel: [String: Any])
}

protocol PLoginPresenterToInteractor: PresenterToInteractor {
    func setUserModel(user: User)
}

protocol PLoginInteractorToPresenter: InteractorToPresenter { }

protocol PLoginPresenterToRouter: PresenterToRouter {
    func navigateToMain()
}

protocol PLoginConnectorToPresenter: ConnectorToPresenter { }
