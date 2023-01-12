//
//  LoginBuilder.swift
//  Diverse-Social-Media
//
//  Created by Oguzhan Yalcin on 8.09.2022.
//

import UIKit

enum LoginBuilder {

    static func buildModule() -> UIViewController {
        let viewController = LoginViewController()
        let interactor = LoginInteractor()
        let router = LoginRouter()
        let presenter = LoginPresenter(view: viewController,
                                       interactor: interactor,
                                       router: router)
        
        router.view = viewController
        
        viewController.presenter = presenter
        viewController.modalPresentationStyle = .fullScreen
        
        interactor.presenter = presenter
        
        return viewController
    }
}
