//
//  RegisterUserTypeRouter.swift
//  Diverse-Social-Media
//
//  Created by Oguzhan Yalcin on 6.09.2022.
//

import Foundation
import UIKit

final class RegisterUserTypeRouter: Routerable {
    
    weak var navigationController: UINavigationController?
    
    public func returnVC(navigationController: UINavigationController?) -> UIViewController {
        return RegisterUserTypeBuilder.buildModule(navigationController: navigationController)
    }
}

extension RegisterUserTypeRouter: PRegisterUserTypePresenterToRouter {
    
    func openNextVC(registerModel: [String: Any]) {
        let nextVC = RegisterUserInfoRouter().returnVC(navigationController: self.navigationController, registerModel: registerModel)
        pushVC(nextVC, navController: self.navigationController, animated: true)
    }
    
    func showAlert(message: String) {
        showAlert(from: navigationController, message: message)
    }
}
