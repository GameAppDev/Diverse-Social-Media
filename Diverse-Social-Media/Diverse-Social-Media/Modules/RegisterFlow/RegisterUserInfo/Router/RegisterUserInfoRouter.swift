//
//  RegisterUserInfoRouter.swift
//  Diverse-Social-Media
//
//  Created by Oguzhan Yalcin on 7.09.2022.
//

import Foundation
import UIKit

final class RegisterUserInfoRouter: Routerable {
    
    var navigationController: UINavigationController?
    
    private func setupModule(registerModel: [String: Any]) -> UIViewController {
        let viewController = RegisterUserInfoViewController(nibName: ApplicationConstants.registerUserInfoVC.nibName, bundle: nil)
        
        let interactor = RegisterUserInfoInteractor()
        let presenter = RegisterUserInfoPresenter(view: viewController, interactor: interactor, router: self, registerModel: registerModel)

        viewController.presenter = presenter
    
        interactor.presenter = presenter
        
        //viewController.modalPresentationStyle = .fullScreen
        return viewController
    }
    
    public func returnVC(registerModel: [String: Any]) -> UIViewController {
        return self.setupModule(registerModel: registerModel)
    }
}

extension RegisterUserInfoRouter: PRegisterUserInfoPresenterToRouter {
    
    func openNextVC(registerModel: [String: Any]) {
        let nextVC = RegisterUsernamePasswordRouter().returnVC(registerModel: registerModel)
        pushVC(nextVC, navController: self.navigationController, animated: true)
    }
    
    func showPopup(message: String) { }
}
