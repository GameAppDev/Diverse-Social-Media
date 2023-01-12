//
//  PickerPresenter.swift
//  Diverse-Social-Media
//
//  Created by Oguzhan Yalcin on 12.01.2023.
//

import Foundation

final class PickerPresenter {
    
    private weak var view: PPickerPresenterToView?
    private var router: PPickerPresenterToRouter?
    
    init(view: PPickerPresenterToView,
         router: PPickerPresenterToRouter) {
        self.view = view
        self.router = router
    }
}
