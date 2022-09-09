//
//  LoginContractor.swift
//  Diverse-Social-Media
//
//  Created by Oguzhan Yalcin on 4.09.2022.
//

import Foundation

protocol PLoginPresenterToView: PresenterToView {
    
    func setupTableView()
}

protocol PLoginViewToPresenter: ViewToPresenter {
    
    func startLoginProcess(loginModel: [String: Any])
}

protocol PLoginPresenterToInteractor {
    
    func fetchUserData(loginModel: [String: Any])
    
    func setUserModel(user: User)
}

protocol PLoginInteractorToPresenter {
    
    func onSuccessLogin(response: User)
    
    func onErrorLogin(error: BaseError)
}

protocol PLoginPresenterToRouter: PresenterToRouter {
    
    func userLoggedIn()
}
