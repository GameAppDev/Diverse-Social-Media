//
//  RegisterUserTypeBuilder.swift
//  Diverse-Social-Media
//
//  Created by Oguzhan Yalcin on 9.09.2022.
//

import Foundation
import UIKit

enum RegisterUserTypeBuilder {

    static func buildModule(navigationController: UINavigationController?) -> UIViewController {
        let viewController = RegisterUserTypeViewController(nibName: ApplicationConstants.registerUserTypeVC.nibName, bundle: nil)
        
        let interactor = RegisterUserTypeInteractor()
        let router = RegisterUserTypeRouter()
        let presenter = RegisterUserTypePresenter(view: viewController, interactor: interactor, router: router)
        
        router.navigationController = navigationController
        
        viewController.presenter = presenter
        
        interactor.presenter = presenter
        
        //viewController.modalPresentationStyle = .fullScreen
        return viewController
    }
}
