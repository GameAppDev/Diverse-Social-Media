//
//  SplashRouter.swift
//  Diverse-Social-Media
//
//  Created by Oguzhan Yalcin on 2.09.2022.
//

import Foundation
import UIKit

final class SplashRouter: Routerable {
    
    private(set) weak var view: Viewable!
    
    private var viewController: SplashViewController?
    
    private func setupModule() -> SplashViewController {
        guard let viewController = UIStoryboard.loadViewController(storyboardName: ApplicationConstants.splashVC.storyboardName, storyboardIdentifier: ApplicationConstants.splashVC.storyboardIdentifier) as? SplashViewController else { return SplashViewController() }
        
        let interactor = SplashInteractor()
        let router = SplashRouter()
        let presenter = SplashPresenter(view: viewController, interactor: interactor, router: router)

        viewController.presenter = presenter
    
        interactor.presenter = presenter
        
        router.viewController = viewController
        
        viewController.modalPresentationStyle = .fullScreen
        return viewController
    }
    
    public func returnVC() -> SplashViewController {
        return self.setupModule()
    }
}

extension SplashRouter: PSplashPresenterToRouter {
    
    func openLoginVC() {
        let nextVC = LoginRouter().returnVC()
        self.viewController?.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    func openRegisterVC() {
        let nextVC = RegisterUserTypeRouter().returnVC()
        self.viewController?.navigationController?.pushViewController(nextVC, animated: true)
    }
}
