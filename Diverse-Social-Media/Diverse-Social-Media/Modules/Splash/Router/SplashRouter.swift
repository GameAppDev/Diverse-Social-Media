//
//  SplashRouter.swift
//  Diverse-Social-Media
//
//  Created by Oguzhan Yalcin on 2.09.2022.
//

import Foundation
import UIKit

final class SplashRouter: Routerable {
    
    weak var navigationController: UINavigationController?
    
    public func returnNC() -> UINavigationController {
        return SplashBuilder.buildModule()
    }
}

extension SplashRouter: PSplashPresenterToRouter {
    
    func openLoginVC() {
        let nextVC = LoginRouter().returnVC(navigationController: self.navigationController)
        pushVC(nextVC, navController: self.navigationController, animated: true)
    }
    
    func openRegisterVC() {
        let nextVC = RegisterUserTypeRouter().returnVC(navigationController: self.navigationController)
        pushVC(nextVC, navController: self.navigationController, animated: true)
    }
}
