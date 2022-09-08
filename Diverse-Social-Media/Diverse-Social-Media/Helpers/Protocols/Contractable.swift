//
//  Contractable.swift
//  Diverse-Social-Media
//
//  Created by Oguzhan Yalcin on 8.09.2022.
//

import Foundation

protocol PresenterToView: AnyObject {
    
    func setupViews()
    
    func setNavBar()
}

protocol ViewToPresenter: AnyObject {
    
    func viewDidLoad()
    
    func viewWillAppear()
}

protocol PresenterToRouter: AnyObject {
    
    func showPopup(message: String)
}
