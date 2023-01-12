//
//  RegisterUserTypeBuilder.swift
//  Diverse-Social-Media
//
//  Created by Oguzhan Yalcin on 9.09.2022.
//

import Foundation
import UIKit

enum RegisterUserTypeBuilder {

    static func buildModule() -> UIViewController {
        let viewController = RegisterUserTypeViewController()
        let interactor = RegisterUserTypeInteractor()
        let router = RegisterUserTypeRouter()
        let presenter = RegisterUserTypePresenter(view: viewController,
                                                  interactor: interactor,
                                                  router: router)
        
        router.view = viewController
        
        viewController.presenter = presenter
        viewController.modalPresentationStyle = .fullScreen
        
        interactor.presenter = presenter
        
        return viewController
    }
}
