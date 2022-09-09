//
//  Contractable.swift
//  Diverse-Social-Media
//
//  Created by Oguzhan Yalcin on 8.09.2022.
//

import Foundation
import UIKit

protocol PresenterToView: AnyObject {
    
    func setupViews()
    
    func setNavBar()
}

protocol ViewToPresenter: AnyObject {
    
    func viewDidLoad()
    
    func viewWillAppear()
}

protocol PresenterToRouter: AnyObject {
    
    func showAlert(from: UINavigationController?, message: String)
}

extension PresenterToRouter {
    
    func showAlert(from navController: UINavigationController?, message: String) {
        let alert = UIAlertController(title: "", message: message, preferredStyle: .alert)
        alert.addAction(.init(title: "OK".localized, style: .cancel, handler: nil))
        navController?.present(alert, animated: true, completion: nil)
    }
}
