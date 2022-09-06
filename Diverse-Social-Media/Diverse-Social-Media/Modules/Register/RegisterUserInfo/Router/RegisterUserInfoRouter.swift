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
    
    private func setupModule(userType: UserTypeItems) -> RegisterUserInfoViewController {
        guard let viewController = UIStoryboard.loadViewController(storyboardName: ApplicationConstants.registerUserInfoVC.storyboardName, storyboardIdentifier: ApplicationConstants.registerUserInfoVC.storyboardIdentifier) as? RegisterUserInfoViewController else { return RegisterUserInfoViewController() }
        
        let interactor = RegisterUserInfoInteractor()
        let router = RegisterUserInfoRouter()
        let presenter = RegisterUserInfoPresenter(view: viewController, interactor: interactor, router: router, userType: userType)

        viewController.presenter = presenter
    
        interactor.presenter = presenter
        
        router.viewController = viewController
        
        viewController.modalPresentationStyle = .fullScreen
        return viewController
    }
    
    public func returnVC(userType: UserTypeItems) -> RegisterUserInfoViewController {
        return self.setupModule(userType: userType)
    }
}

extension RegisterUserInfoRouter: PRegisterUserInfoPresenterToRouter {
    
    func openNextVC() { }
}
