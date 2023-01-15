//
//  RegisterUsernamePasswordBuilder.swift
//  Diverse-Social-Media
//
//  Created by Oguzhan Yalcin on 9.09.2022.
//

import Foundation
import UIKit

enum RegisterUsernamePasswordBuilder {

    static func buildModule(navigationController: UINavigationController?, registerModel: [String: Any]) -> UIViewController {
        let viewController = RegisterUsernamePasswordViewController()

        let interactor = RegisterUsernamePasswordInteractor()
        let router = RegisterUsernamePasswordRouter()
        let presenter = RegisterUsernamePasswordPresenter(view: viewController,
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
