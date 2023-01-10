//
//  RegisterUserTypeContractor.swift
//  Diverse-Social-Media
//
//  Created by Oguzhan Yalcin on 6.09.2022.
//

import Foundation

protocol PRegisterUserTypePresenterToView: PresenterToView {
    func setupCollectionView()
    func reloadCollectionView()
}

protocol PRegisterUserTypeViewToPresenter: ViewToPresenter {
    func setUserTypeAndReloadCollectionView(index: Int, isSelected:Bool)
    func navigateToNext()
}

protocol PRegisterUserTypePresenterToRouter: PresenterToRouter {
    func openNextVC(registerModel: [String: Any])
}
