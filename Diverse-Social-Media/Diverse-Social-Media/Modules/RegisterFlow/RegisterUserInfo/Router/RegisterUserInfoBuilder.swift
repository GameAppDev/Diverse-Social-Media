//
//  RegisterUserInfoBuilder.swift
//  Diverse-Social-Media
//
//  Created by Oguzhan Yalcin on 9.09.2022.
//

import UIKit

enum RegisterUserInfoBuilder {

    static func buildModule(navigationController: UINavigationController?, registerModel: [String: Any]) -> UIViewController {
        let viewController = RegisterUserInfoViewController()
        
        let interactor = RegisterUserInfoInteractor()
        let router = RegisterUserInfoRouter()
        let presenter = RegisterUserInfoPresenter(view: viewController,
                                                  interactor: interactor,
                                                  router: router,
                                                  registerModel: registerModel)
        
        router.navigationController = navigationController
        
        viewController.presenter = presenter
        
        interactor.presenter = presenter
        
        //viewController.modalPresentationStyle = .fullScreen
        return viewController
    }
}
