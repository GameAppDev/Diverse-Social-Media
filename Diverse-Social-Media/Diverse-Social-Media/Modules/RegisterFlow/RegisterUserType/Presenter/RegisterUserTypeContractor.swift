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
    
    func setUserTypeAndReloadCollectionView(index: Int, isSelected:Bool)
    
    func navigateToNext()
}

protocol PRegisterUserTypePresenterToRouter {
    
    func showPopup(message: String)
    
    func openNextVC(registerModel: [String: Any])
}
