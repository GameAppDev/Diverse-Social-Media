//
//  LoginRouter.swift
//  Diverse-Social-Media
//
//  Created by Oguzhan Yalcin on 2.09.2022.
//

import Foundation
import UIKit

final class LoginRouter: Routerable {
    
    weak var navigationController: UINavigationController?
    
    public func returnVC(navigationController: UINavigationController?) -> UIViewController {
        return LoginBuilder.buildModule(navigationController: navigationController)
    }
}

extension LoginRouter: PLoginPresenterToRouter {
    
    func showAlert(message: String) {
        showAlert(from: navigationController, message: message)
    }
    
    func userLoggedIn() { }
}
