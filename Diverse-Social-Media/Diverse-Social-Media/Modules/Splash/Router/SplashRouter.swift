//
//  SplashRouter.swift
//  Diverse-Social-Media
//
//  Created by Oguzhan Yalcin on 2.09.2022.
//

import Foundation
import UIKit

final class SplashRouter: Routerable {
    
    var navigationController: UINavigationController?
    
    public func returnNC() -> UINavigationController {
        return SplashBuilder.setupModule()
    }
}

extension SplashRouter: PSplashPresenterToRouter {
    
    func openLoginVC() {
        let nextVC = LoginRouter().returnVC()
        navigationController?.pushViewController(nextVC, animated: true)
        //pushVC(nextVC, navController: self.navigationController, animated: true)
    }
    
    func openRegisterVC() {
        let nextVC = RegisterUserTypeRouter().returnVC()
        pushVC(nextVC, navController: self.navigationController, animated: true)
    }
}
