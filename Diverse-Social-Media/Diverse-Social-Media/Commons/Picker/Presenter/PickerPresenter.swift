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

extension PickerPresenter: PPickerViewToPresenter {
    
    // MARK: - PresenterToView
    func viewDidLoad() { }
    
    func viewWillAppear() { }
}

extension PickerPresenter: PPickerInteractorToPresenter {
    
    // MARK: - InteractorToPresenter
    func setData<T>(data: T) { }
    
    func setError(error: BaseError) { }
}

extension PickerPresenter: PPickerConnectorToPresenter { }
