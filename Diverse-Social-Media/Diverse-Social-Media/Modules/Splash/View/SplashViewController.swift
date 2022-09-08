//
//  SplashViewController.swift
//  Diverse-Social-Media
//
//  Created by Oguzhan Yalcin on 8.09.2022.
//

import UIKit

class SplashViewController: BaseViewController {

    @IBOutlet private weak var titleLabel: UILabel!
    
    @IBOutlet private weak var loginButton: UIButton!
    @IBOutlet private weak var registerButton: UIButton!
    
    @IBOutlet private weak var languageImageView: UIImageView!
    @IBOutlet private weak var languageLabel: UILabel!
    
    public var presenter: SplashPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter?.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        presenter?.viewWillAppear()
    }
    
    public func setNavBar() {
        setNavigationBarItems(title: "", leftButton: nil, rightButton: nil, containerColour: UIColor.navbarBGColour)
    }
    
    public func setupViews() {
        titleLabel.text = "Welcome to Diverse Social Media Application".localized
        titleLabel.font = UIFont.titleFont
        titleLabel.textColor = UIColor.titleColour
        
        loginButton.setTitle("Login".localized, for: .normal)
        loginButton.titleLabel?.font = UIFont.buttonTitleFont
        loginButton.setTitleColor(UIColor.buttonTitleColour, for: .normal)
        loginButton.backgroundColor = UIColor.buttonBGColour
        
        registerButton.setTitle("Register".localized, for: .normal)
        registerButton.titleLabel?.font = UIFont.buttonTitleFont
        registerButton.setTitleColor(UIColor.buttonTitleColour, for: .normal)
        registerButton.backgroundColor = UIColor.buttonBGColour
        
        languageImageView.image = UIImage(named: "")
        languageLabel.text = ""
        languageLabel.font = UIFont.textFont
        languageLabel.textColor = UIColor.textColour
    }
    
    public func setLanguage(language: String) {
        languageImageView.image = UIImage(named: language)
        languageLabel.text = language
    }
    
    public func setGestureRecognizerForLanguage() {
        let tapGestureRec = UITapGestureRecognizer(target: self, action: #selector(self.languageClicked(sender:)))
        languageImageView.addGestureRecognizer(tapGestureRec)
        languageLabel.addGestureRecognizer(tapGestureRec)
    }
    
    @objc private func languageClicked(sender: UITapGestureRecognizer) {
        presenter?.openLanguagePicker()
    }

    @IBAction private func loginClicked(_ sender: UIButton) {
        presenter?.navigateToLogin()
    }
    
    @IBAction private func registerClicked(_ sender: UIButton) {
        presenter?.navigateToRegister()
    }
}
