//
//  RegisterUsernamePasswordRouter.swift
//  Diverse-Social-Media
//
//  Created by Oguzhan Yalcin on 7.09.2022.
//

import UIKit

final class RegisterUsernamePasswordRouter: Routerable {
    
    weak var navigationController: UINavigationController?
    
    public func returnVC(navigationController: UINavigationController?, registerModel: [String: Any]) -> UIViewController {
        return RegisterUsernamePasswordBuilder.buildModule(navigationController: navigationController, registerModel: registerModel)
    }
}

extension RegisterUsernamePasswordRouter: PRegisterUsernamePasswordPresenterToRouter {
    
    func openHomeVC(registerModel: [String : Any]) { }
    
    func showAlert(message: String) { }
}
