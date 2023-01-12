//
//  PopupRouter.swift
//  Diverse-Social-Media
//
//  Created by Oguzhan Yalcin on 10.01.2023.
//

import UIKit

final class PopupRouter {

    weak var view: UIViewController?

    static func setupModule(popupSettings: PopupSettings,
                            buttonActions: PopupButtonDelegate?) -> PopupViewController {
        let viewController = PopupViewController()
        let router = PopupRouter()
        let presenter = PopupPresenter(view: viewController,
                                       router: router,
                                       popupSettings: popupSettings)
        
        viewController.presenter = presenter
        viewController.modalPresentationStyle = .overCurrentContext
        viewController.buttonActions = buttonActions

        router.view = viewController

        return viewController
    }
}

extension PopupRouter: PPopupPresenterToRouter { }
