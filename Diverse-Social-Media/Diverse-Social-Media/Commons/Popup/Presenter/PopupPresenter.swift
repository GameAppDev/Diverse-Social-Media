//
//  PopupPresenter.swift
//  Diverse-Social-Media
//
//  Created by Oguzhan Yalcin on 10.01.2023.
//

import Foundation

final class PopupPresenter {
    
    private weak var view: PPopupPresenterToView?
    private var router: PPopupPresenterToRouter
    private var popupSettings: PopupSettings
    
    init(view: PPopupPresenterToView,
         router: PPopupPresenterToRouter,
         popupSettings: PopupSettings) {
        self.view = view
        self.router = router
        self.popupSettings = popupSettings
    }
}

extension PopupPresenter: PPopupViewToPresenter {
    
    // MARK: - ViewToPresenter
    func viewDidLoad() {
        view?.setTitle(text: popupSettings.title)
        view?.setContent(text: popupSettings.content)
        view?.setImage(name: popupSettings.imageName)
        view?.setButtons(type: popupSettings.buttonType)
        view?.setLeftButton(title: popupSettings.leftButtonText)
        view?.setRightButton(title: popupSettings.rightButtonText)
    }
    
    func viewWillAppear() { }
}
