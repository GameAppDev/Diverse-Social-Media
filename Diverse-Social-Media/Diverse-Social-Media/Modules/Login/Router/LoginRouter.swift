//
//  LoginRouter.swift
//  Diverse-Social-Media
//
//  Created by Oguzhan Yalcin on 2.09.2022.
//

import Foundation
import UIKit

final class LoginRouter: Routerable {
    
    private(set) weak var view: Viewable!
    
    private var viewController: LoginViewController?
    
    private func setupModule() -> LoginViewController {
        guard let viewController = UIStoryboard.loadViewController(storyboardName: ApplicationConstants.loginVC.storyboardName, storyboardIdentifier: ApplicationConstants.loginVC.storyboardIdentifier) as? LoginViewController else { return LoginViewController() }
        
        let interactor = LoginInteractor()
        let router = LoginRouter()
        let presenter = LoginPresenter(view: viewController, interactor: interactor, router: router)
        
        viewController.presenter = presenter
        
        interactor.presenter = presenter
        
        router.viewController = viewController
        
        viewController.modalPresentationStyle = .fullScreen
        return viewController
    }
    
    public func returnVC() -> LoginViewController {
        return setupModule()
    }
}

extension LoginRouter: PLoginPresenterToRouter {
    
    func showPopup(message: String) { }
    
    func userLoggedIn() { }
}
