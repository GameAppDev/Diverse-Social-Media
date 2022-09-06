//
//  RegisterUserTypeContractor.swift
//  Diverse-Social-Media
//
//  Created by Oguzhan Yalcin on 6.09.2022.
//

import Foundation

protocol PRegisterUserTypeViewToPresenter {
    func viewDidLoad()
    func viewWillAppear()
    func setCollectionViewUIAndUserType(index: Int, isSelected:Bool)
    func navigateToNext()
}

protocol PRegisterUserTypePresenterToRouter {
    func openNextVC()
}
