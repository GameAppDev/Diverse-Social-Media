//
//  RegisterUserInfoRouter.swift
//  Diverse-Social-Media
//
//  Created by Oguzhan Yalcin on 7.09.2022.
//

import Foundation
import UIKit

final class RegisterUserInfoRouter: Routerable {
    
    private(set) weak var view: Viewable!
    
    private var viewController: RegisterUserInfoViewController?
    
    private func setupModule(registerModel: [String: Any]) -> RegisterUserInfoViewController {
        guard let viewController = UIStoryboard.loadViewController(storyboardName: ApplicationConstants.registerUserInfoVC.storyboardName, storyboardIdentifier: ApplicationConstants.registerUserInfoVC.storyboardIdentifier) as? RegisterUserInfoViewController else { return RegisterUserInfoViewController() }
        
        let interactor = RegisterUserInfoInteractor()
        let router = RegisterUserInfoRouter()
        let presenter = RegisterUserInfoPresenter(view: viewController, interactor: interactor, router: router, registerModel: registerModel)

        viewController.presenter = presenter
    
        interactor.presenter = presenter
        
        router.viewController = viewController
        
        viewController.modalPresentationStyle = .fullScreen
        return viewController
    }
    
    public func returnVC(registerModel: [String: Any]) -> RegisterUserInfoViewController {
        return self.setupModule(registerModel: registerModel)
    }
}

extension RegisterUserInfoRouter: PRegisterUserInfoPresenterToRouter {
    
    func openNextVC(registerModel: [String: Any]) {
        let nextVC = RegisterUsernamePasswordRouter().returnVC(registerModel: registerModel)
        self.viewController?.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    func showPopup(message: String) { }
}
