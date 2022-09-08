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
    
    private func setupModule() -> UINavigationController {
        let viewController = SplashViewController(nibName: ApplicationConstants.splashVC.nibName, bundle: nil)
        
        let interactor = SplashInteractor()
        let presenter = SplashPresenter(view: viewController, interactor: interactor, router: self)

        let navigationController = UINavigationController(rootViewController: viewController)
        self.navigationController = navigationController
        
        viewController.presenter = presenter
    
        interactor.presenter = presenter
        
        //viewController.modalPresentationStyle = .fullScreen
        return navigationController
    }
    
    public func returnVC() -> UIViewController {
        return self.setupModule()
    }
}

extension SplashRouter: PSplashPresenterToRouter {
    
    func openLoginVC() {
        let nextVC = LoginRouter().returnVC()
        pushVC(nextVC, navController: self.navigationController, animated: true)
    }
    
    func openRegisterVC() {
        let nextVC = RegisterUserTypeRouter().returnVC()
        pushVC(nextVC, navController: self.navigationController, animated: true)
    }
}
