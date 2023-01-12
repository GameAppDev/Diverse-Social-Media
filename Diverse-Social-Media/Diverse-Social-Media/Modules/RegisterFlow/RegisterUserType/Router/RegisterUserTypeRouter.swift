//
//  RegisterUserTypeRouter.swift
//  Diverse-Social-Media
//
//  Created by Oguzhan Yalcin on 6.09.2022.
//

import UIKit

final class RegisterUserTypeRouter {
    
    weak var view: UIViewController?
    
    public func returnVC() -> UIViewController {
        return RegisterUserTypeBuilder.buildModule()
    }
}

extension RegisterUserTypeRouter: PRegisterUserTypePresenterToRouter {
    
    func openNextVC(registerModel: [String: Any]) {
        //let nextVC = RegisterUserInfoRouter().returnVC(navigationController: self.navigationController, registerModel: registerModel)
        //pushVC(nextVC, navController: self.navigationController, animated: true)
    }
    
    func showAlert(message: String) { }
}
