//
//  RegisterUserInfoRouter.swift
//  Diverse-Social-Media
//
//  Created by Oguzhan Yalcin on 7.09.2022.
//

import UIKit

final class RegisterUserInfoRouter: Routerable {
    
    weak var navigationController: UINavigationController?
    
    public func returnVC(navigationController: UINavigationController?, registerModel: [String: Any]) -> UIViewController {
        return RegisterUserInfoBuilder.buildModule(navigationController: navigationController, registerModel: registerModel)
    }
}

extension RegisterUserInfoRouter: PRegisterUserInfoPresenterToRouter {
    
    func openNextVC(registerModel: [String: Any]) {
        let nextVC = RegisterUsernamePasswordRouter().returnVC(navigationController: self.navigationController, registerModel: registerModel)
        pushVC(nextVC, navController: self.navigationController, animated: true)
    }
    
    func showAlert(message: String) { }
}
