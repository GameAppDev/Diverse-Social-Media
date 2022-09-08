//
//  SplashBuilder.swift
//  Diverse-Social-Media
//
//  Created by Oguzhan Yalcin on 8.09.2022.
//

import Foundation
import UIKit

enum SplashBuilder {

    static func setupModule() -> UINavigationController {
        let viewController = SplashViewController()
        
        let interactor = SplashInteractor()
        let router = SplashRouter()
        let presenter = SplashPresenter(view: viewController, interactor: interactor, router: router)
        
        let navigationController = UINavigationController(rootViewController: viewController)
        router.navigationController = navigationController
        
        viewController.presenter = presenter
        
        interactor.presenter = presenter
        
        return navigationController
    }
}
