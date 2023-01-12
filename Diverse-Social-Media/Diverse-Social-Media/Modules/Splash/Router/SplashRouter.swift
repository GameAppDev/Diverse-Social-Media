//
//  SplashRouter.swift
//  Diverse-Social-Media
//
//  Created by Oguzhan Yalcin on 2.09.2022.
//

import UIKit

final class SplashRouter {
    
    weak var view: UIViewController?
    
    public func returnVC() -> UIViewController {
        return SplashBuilder.buildModule()
    }
}

extension SplashRouter: PSplashPresenterToRouter {
    
    func navigateToLogin() {
        let viewController = LoginRouter().returnVC()
        view?.navigationController?.push(viewController)
    }
    
    func navigateToRegister() {
        let viewController = RegisterUserTypeRouter().returnVC()
        view?.navigationController?.push(viewController)
    }
}
