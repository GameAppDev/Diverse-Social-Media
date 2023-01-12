//
//  PickerRouter.swift
//  Diverse-Social-Media
//
//  Created by Oguzhan Yalcin on 12.01.2023.
//

import UIKit

final class PickerRouter {
    
    weak var view: UIViewController?
    
    public func returnVC() -> UIViewController {
        return PickerBuilder.buildModule()
    }
}

extension PickerRouter: PPickerPresenterToRouter { }
