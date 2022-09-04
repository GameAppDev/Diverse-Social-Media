//
//  SplashRouter.swift
//  Diverse-Social-Media
//
//  Created by Oguzhan Yalcin on 2.09.2022.
//

import Foundation
import UIKit

final class SplashRouter {
    
    public weak var view: SplashViewController?
    
    private func setupModule() -> SplashViewController {
        guard let viewController = UIStoryboard.loadViewController(storyboardName: ApplicationConstants.splashVC.storyboardName, storyboardIdentifier: ApplicationConstants.splashVC.storyboardIdentifier) as? SplashViewController else { return SplashViewController() }
        
        let interactor = SplashInteractor()
        let router = SplashRouter()
        let presenter = SplashPresenter(view: viewController, interactor: interactor, router: router)

        viewController.presenter = presenter
    
        interactor.presenter = presenter
        
        router.view = viewController
        
        viewController.modalPresentationStyle = .fullScreen
        return viewController
    }
    
    public func openVC() -> SplashViewController {
        return self.setupModule()
    }
}

extension SplashRouter: PSplashPresenterToRouter {
    
    func openLoginVC() { }
    
    func openRegisterVC() { }
}
