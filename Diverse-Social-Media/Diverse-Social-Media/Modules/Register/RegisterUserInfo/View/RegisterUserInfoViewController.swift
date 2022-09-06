//
//  RegisterUserInfoViewController.swift
//  Diverse-Social-Media
//
//  Created by Oguzhan Yalcin on 7.09.2022.
//

import UIKit

class RegisterUserInfoViewController: BaseViewController {

    public var presenter: RegisterUserInfoPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        presenter?.viewWillAppear()
    }
    
    public func setNavBar() {
        setNavigationBarItems(title: "About You".localized, leftButton: .back, rightButton: nil, containerColour: UIColor.navbarBGColour)
    }
    
    public func setupViews() { }
}
