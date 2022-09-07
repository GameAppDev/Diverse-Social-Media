//
//  RegisterUsernamePasswordRouter.swift
//  Diverse-Social-Media
//
//  Created by Oguzhan Yalcin on 7.09.2022.
//

import Foundation
import UIKit

final class RegisterUsernamePasswordRouter: Routerable {
    
    private(set) weak var view: Viewable!
    
    private var viewController: RegisterUsernamePasswordViewController?
    
    private func setupModule(registerModel: [String: Any]) -> RegisterUsernamePasswordViewController {
        guard let viewController = UIStoryboard.loadViewController(storyboardName: ApplicationConstants.registerUsernamePasswordVC.storyboardName, storyboardIdentifier: ApplicationConstants.registerUsernamePasswordVC.storyboardIdentifier) as? RegisterUsernamePasswordViewController else { return RegisterUsernamePasswordViewController() }
        
        let interactor = RegisterUsernamePasswordInteractor()
        let router = RegisterUsernamePasswordRouter()
        let presenter = RegisterUsernamePasswordPresenter(view: viewController, interactor: interactor, router: router, registerModel: registerModel)

        viewController.presenter = presenter
    
        interactor.presenter = presenter
        
        router.viewController = viewController
        
        viewController.modalPresentationStyle = .fullScreen
        return viewController
    }
    
    public func returnVC(registerModel: [String: Any]) -> RegisterUsernamePasswordViewController {
        return self.setupModule(registerModel: registerModel)
    }
}

extension RegisterUsernamePasswordRouter: PRegisterUsernamePasswordPresenterToRouter {
    
    func openHomeVC(email: String, about: String) { }
    
    func showPopup(message: String) { }
}
