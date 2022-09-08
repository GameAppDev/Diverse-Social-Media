//
//  LoginRouter.swift
//  Diverse-Social-Media
//
//  Created by Oguzhan Yalcin on 2.09.2022.
//

import Foundation
import UIKit

final class LoginRouter: Routerable {
    
    var navigationController: UINavigationController?
    
    private func setupModule() -> UIViewController {
        let viewController = LoginViewController(nibName: ApplicationConstants.loginVC.nibName, bundle: nil)
        
        let interactor = LoginInteractor()
        let presenter = LoginPresenter(view: viewController, interactor: interactor, router: self)
        
        viewController.presenter = presenter
    
        interactor.presenter = presenter
        
        //viewController.modalPresentationStyle = .fullScreen
        return viewController
    }
    
    public func returnVC() -> UIViewController {
        return setupModule()
    }
}

extension LoginRouter: PLoginPresenterToRouter {
    
    func showPopup(message: String) { }
    
    func userLoggedIn() { }
}
