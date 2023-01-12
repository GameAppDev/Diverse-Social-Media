//
//  PickerBuilder.swift
//  Diverse-Social-Media
//
//  Created by Oguzhan Yalcin on 12.01.2023.
//

import UIKit

enum PickerBuilder {

    static func buildModule() -> UIViewController {
        let viewController = Picker()
        let router = PickerRouter()
        let presenter = PickerPresenter(view: viewController,
                                        router: router)
        
        router.view = viewController
        
        viewController.presenter = presenter
        viewController.modalPresentationStyle = .fullScreen
        
        return viewController
    }
}
