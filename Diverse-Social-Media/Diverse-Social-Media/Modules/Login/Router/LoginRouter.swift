//
//  LoginRouter.swift
//  Diverse-Social-Media
//
//  Created by Oguzhan Yalcin on 2.09.2022.
//

import Foundation
import UIKit

final class LoginRouter: Routerable {
    
    var navigationController: UINavigationController?
    
    public func returnVC() -> UIViewController {
        return LoginBuilder.setupModule()
    }
}

extension LoginRouter: PLoginPresenterToRouter {
    
    func showPopup(message: String) { }
    
    func userLoggedIn() { }
}
