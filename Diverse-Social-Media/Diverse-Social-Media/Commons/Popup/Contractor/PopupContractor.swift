//
//  PopupContractor.swift
//  Diverse-Social-Media
//
//  Created by Oguzhan Yalcin on 10.01.2023.
//

import UIKit

protocol PPopupPresenterToView: PresenterToView {
    func setTitle(text: String?)
    func setContent(text: String?)
    func setImage(name: String?)
    func setButtons(type: PopupButtonType)
    func setLeftButton(title: String?)
    func setRightButton(title: String?)
}

protocol PPopupViewToPresenter: ViewToPresenter { }

protocol PPopupPresenterToRouter: AnyObject { }

@objc protocol PopupButtonDelegate: AnyObject {
    @objc optional func rightButtonClicked()
    @objc optional func rightButtonClicked(with identifier: String?)
    @objc optional func leftButtonClicked()
    @objc optional func leftButtonClicked(with identifier: String?)
}
