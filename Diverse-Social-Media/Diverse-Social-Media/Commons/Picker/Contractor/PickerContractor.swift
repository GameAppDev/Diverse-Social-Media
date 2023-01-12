//
//  PickerContractor.swift
//  Diverse-Social-Media
//
//  Created by Oguzhan Yalcin on 12.01.2023.
//

import Foundation

protocol PPickerPresenterToView: PresenterToView { }

protocol PPickerViewToPresenter: ViewToPresenter { }

protocol PPickerPresenterToInteractor: PresenterToInteractor { }

protocol PPickerInteractorToPresenter: InteractorToPresenter { }

protocol PPickerPresenterToRouter: PresenterToRouter { }

protocol PPickerConnectorToPresenter: ConnectorToPresenter { }

@objc protocol PickerDelegate: AnyObject {
    func pickerSelected(selectedIndex: Int, pickerView: Picker)
    @objc optional func buttonClicked(selectedIndex: Int, pickerView: Picker)
}
