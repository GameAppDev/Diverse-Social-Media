//
//  SplashBuilder.swift
//  Diverse-Social-Media
//
//  Created by Oguzhan Yalcin on 8.09.2022.
//

import UIKit

enum SplashBuilder {

    static func buildModule() -> UIViewController {
        let viewController = SplashViewController()
        let router = SplashRouter()
        let presenter = SplashPresenter(view: viewController,
                                        router: router)
        
        router.view = viewController
        
        viewController.presenter = presenter
        viewController.modalPresentationStyle = .fullScreen
        
        return viewController
    }
}
