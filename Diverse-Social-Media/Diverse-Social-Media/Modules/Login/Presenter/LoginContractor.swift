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
    
    func startLoginProcess(username: String, password: String)
}

protocol PLoginPresenterToInteractor {
    
    func fetchUserData(username: String, password: String)
    
    func setUserModel(user: User)
}

protocol PLoginInteractorToPresenter {
    
    func onSuccessLogin(response: User)
    
    func onErrorLogin(error: BaseError)
}

protocol PLoginPresenterToRouter: PresenterToRouter {
    
    func userLoggedIn()
}
