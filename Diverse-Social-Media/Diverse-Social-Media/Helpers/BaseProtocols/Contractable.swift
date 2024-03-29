//
//  Contractable.swift
//  Diverse-Social-Media
//
//  Created by Oguzhan Yalcin on 8.09.2022.
//

import UIKit

// MARK: - PresenterToView
protocol PresenterToView: AnyObject {
    func showIndicatorView()
    func hideIndicatorView()
    func showPopup(identifier: String?,
                   title: String?,
                   content: String?,
                   image: String?,
                   buttonType: PopupButtonType?,
                   leftButtonText: String?,
                   rightButtonText: String?,
                   rightButtonAction: PopupButtonDelegate?,
                   parentVC: UIViewController)
}

extension UIViewController: PresenterToView {
    
    func showIndicatorView() {
        // MARK: - ActivityIndicatorManager will be added.
    }
    
    func hideIndicatorView() {
        // MARK: - ActivityIndicatorManager will be added.
    }
    
    func showPopup(identifier: String?,
                   title: String?,
                   content: String?,
                   image: String?,
                   buttonType: PopupButtonType?,
                   leftButtonText: String?,
                   rightButtonText: String?,
                   rightButtonAction: PopupButtonDelegate?,
                   parentVC: UIViewController) {
        PopupBuilder()
            .setPopupIdentifier(identifier.orEmpty)
            .setTitle(title.orEmpty)
            .setContent(content.orEmpty)
            .setImageName(image.orEmpty)
            .setButtonType(buttonType ?? .single)
            .setLeftButtonText(leftButtonText.orEmpty)
            .setRightButtonText(rightButtonText.orEmpty)
            .build()
            .show(parentVC: parentVC, buttonActions: rightButtonAction)
    }
}

// MARK: - ViewToPresenter
@objc protocol ViewToPresenter: AnyObject {
    func viewDidLoad()
    func viewWillAppear()
    @objc optional func viewDidAppear()
    @objc optional func viewWillDisappear()
    @objc optional func viewDidDisappear()
}

// MARK: - PresenterToInteractor
protocol PresenterToInteractor: AnyObject {
    func fetchData<T>(request: T)
}

// MARK: - InteractorToPresenter
protocol InteractorToPresenter: AnyObject {
    func setData<T>(data: T)
    func setError(error: BaseError)
}

// MARK: - PresenterToRouter
protocol PresenterToRouter: AnyObject { }

// MARK: - ConnectorToPresenter
@objc protocol ConnectorToPresenter: AnyObject { }
