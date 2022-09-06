//
//  LoginViewController.swift
//  Diverse-Social-Media
//
//  Created by Oguzhan Yalcin on 2.09.2022.
//

import UIKit

class LoginViewController: BaseViewController {

    @IBOutlet private weak var usernameTF: UITextField!
    @IBOutlet private weak var passwordTF: UITextField!
    @IBOutlet private weak var loginButton: UIButton!
    
    public var presenter: LoginPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        
        presenter?.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        presenter?.viewWillAppear()
    }
    
    public func setNavBar() {
        setNavigationBarItems(title: "Login".localized, leftButton: .back, rightButton: nil, containerColour: UIColor.navbarBGColour)
    }
    
    public func setupViews() {
        loginButton.setTitle("Login".localized, for: .normal)
        loginButton.titleLabel?.font = UIFont.buttonTitleFont
        loginButton.setTitleColor(UIColor.buttonTitleColour, for: .normal)
        loginButton.backgroundColor = UIColor.buttonBGColour
    }
    
    @IBAction private func loginClicked(_ sender: UIButton) {
        presenter?.startLoginProcess(username: usernameTF.text ?? "", password: passwordTF.text ?? "")
    }
}
