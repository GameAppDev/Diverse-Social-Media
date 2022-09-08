//
//  RegisterUserTypeRouter.swift
//  Diverse-Social-Media
//
//  Created by Oguzhan Yalcin on 6.09.2022.
//

import Foundation
import UIKit

final class RegisterUserTypeRouter: Routerable {
    
    var navigationController: UINavigationController?
    
    private func setupModule() -> RegisterUserTypeViewController {
        let viewController = RegisterUserTypeViewController(nibName: ApplicationConstants.registerUserTypeVC.nibName, bundle: nil)
        
        let interactor = RegisterUserTypeInteractor()
        let presenter = RegisterUserTypePresenter(view: viewController, interactor: interactor, router: self)

        viewController.presenter = presenter
    
        interactor.presenter = presenter
        
        //viewController.modalPresentationStyle = .fullScreen
        return viewController
    }
    
    public func returnVC() -> UIViewController {
        return self.setupModule()
    }
}

extension RegisterUserTypeRouter: PRegisterUserTypePresenterToRouter {
    
    func openNextVC(registerModel: [String: Any]) {
        let nextVC = RegisterUserInfoRouter().returnVC(registerModel: registerModel)
        pushVC(nextVC, navController: self.navigationController, animated: true)
    }
    
    func showPopup(message: String) { }
}
