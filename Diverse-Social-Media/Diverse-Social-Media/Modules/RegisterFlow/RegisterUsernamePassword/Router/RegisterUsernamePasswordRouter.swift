//
//  RegisterUsernamePasswordRouter.swift
//  Diverse-Social-Media
//
//  Created by Oguzhan Yalcin on 7.09.2022.
//

import Foundation
import UIKit

final class RegisterUsernamePasswordRouter: Routerable {
    
    var navigationController: UINavigationController?
    
    private func setupModule(registerModel: [String: Any]) -> UIViewController {
        let viewController = RegisterUsernamePasswordViewController(nibName: ApplicationConstants.registerUsernamePasswordVC.nibName, bundle: nil)
        
        let interactor = RegisterUsernamePasswordInteractor()
        let presenter = RegisterUsernamePasswordPresenter(view: viewController, interactor: interactor, router: self, registerModel: registerModel)

        viewController.presenter = presenter
    
        interactor.presenter = presenter
        
        //viewController.modalPresentationStyle = .fullScreen
        return viewController
    }
    
    public func returnVC(registerModel: [String: Any]) -> UIViewController {
        return self.setupModule(registerModel: registerModel)
    }
}

extension RegisterUsernamePasswordRouter: PRegisterUsernamePasswordPresenterToRouter {
    
    func openHomeVC(registerModel: [String : Any]) { }
    
    func showPopup(message: String) { }
}
