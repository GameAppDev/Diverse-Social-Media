//
//  LoginRouter.swift
//  Diverse-Social-Media
//
//  Created by Oguzhan Yalcin on 2.09.2022.
//

import UIKit

final class LoginRouter {
    
    weak var view: UIViewController?
    
    public func returnVC() -> UIViewController {
        return LoginBuilder.buildModule()
    }
}

extension LoginRouter: PLoginPresenterToRouter {
    
    func navigateToMain() { }
}
