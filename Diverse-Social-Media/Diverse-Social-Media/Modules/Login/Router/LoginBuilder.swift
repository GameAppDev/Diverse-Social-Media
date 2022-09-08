//
//  LoginBuilder.swift
//  Diverse-Social-Media
//
//  Created by Oguzhan Yalcin on 8.09.2022.
//

import Foundation
import UIKit

enum LoginBuilder {

    static func setupModule() -> UIViewController {
        let viewController = LoginViewController(nibName: ApplicationConstants.loginVC.nibName, bundle: nil)
        
        let interactor = LoginInteractor()
        let router = LoginRouter()
        let presenter = LoginPresenter(view: viewController, interactor: interactor, router: router)
        
        viewController.presenter = presenter
    
        interactor.presenter = presenter
        
        //viewController.modalPresentationStyle = .fullScreen
        return viewController
    }
}
