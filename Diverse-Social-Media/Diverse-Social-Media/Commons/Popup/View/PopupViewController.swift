//
//  PopupViewController.swift
//  Diverse-Social-Media
//
//  Created by Oguzhan Yalcin on 10.01.2023.
//

import UIKit

final class PopupViewController: BaseViewController {

    var presenter: PPopupViewToPresenter?
    var buttonActions: PopupButtonDelegate?
    var dismissDelegate: PopupDismissDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter?.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        presenter?.viewWillAppear()
    }
}

extension PopupViewController: PPopupPresenterToView {
    
    func setTitle(text: String?) { }
    
    func setContent(text: String?) { }
    
    func setImage(name: String?) { }
    
    func setButtons(type: PopupButtonType) { }
    
    func setLeftButton(title: String?) { }
    
    func setRightButton(title: String?) { }
}
