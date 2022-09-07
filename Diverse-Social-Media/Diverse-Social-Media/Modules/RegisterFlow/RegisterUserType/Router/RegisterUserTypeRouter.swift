//
//  RegisterUserTypeRouter.swift
//  Diverse-Social-Media
//
//  Created by Oguzhan Yalcin on 6.09.2022.
//

import Foundation
import UIKit

final class RegisterUserTypeRouter: Routerable {
    
    private(set) weak var view: Viewable!
    
    private var viewController: RegisterUserTypeViewController?
    
    private func setupModule() -> RegisterUserTypeViewController {
        guard let viewController = UIStoryboard.loadViewController(storyboardName: ApplicationConstants.registerUserTypeVC.storyboardName, storyboardIdentifier: ApplicationConstants.registerUserTypeVC.storyboardIdentifier) as? RegisterUserTypeViewController else { return RegisterUserTypeViewController() }
        
        let interactor = RegisterUserTypeInteractor()
        let router = RegisterUserTypeRouter()
        let presenter = RegisterUserTypePresenter(view: viewController, interactor: interactor, router: router)

        viewController.presenter = presenter
    
        interactor.presenter = presenter
        
        router.viewController = viewController
        
        viewController.modalPresentationStyle = .fullScreen
        return viewController
    }
    
    public func returnVC() -> RegisterUserTypeViewController {
        return self.setupModule()
    }
}

extension RegisterUserTypeRouter: PRegisterUserTypePresenterToRouter {
    
    func openNextVC(registerModel: [String: Any]) {
        let nextVC = RegisterUserInfoRouter().returnVC(registerModel: registerModel)
        self.viewController?.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    func showPopup(message: String) { }
}
