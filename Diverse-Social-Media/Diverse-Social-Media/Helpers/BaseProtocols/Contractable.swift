//
//  Contractable.swift
//  Diverse-Social-Media
//
//  Created by Oguzhan Yalcin on 8.09.2022.
//

import UIKit

// MARK: - PresenterToView
@objc protocol PresenterToView: AnyObject {
    func showIndicatorView()
    func hideIndicatorView()
    @objc optional func setNavBar(title: String)
}

extension UIViewController: PresenterToView {
    
    func showIndicatorView() {
        // MARK: - ActivityIndicatorManager will be added.
    }
    
    func hideIndicatorView() {
        // MARK: - ActivityIndicatorManager will be added.
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
