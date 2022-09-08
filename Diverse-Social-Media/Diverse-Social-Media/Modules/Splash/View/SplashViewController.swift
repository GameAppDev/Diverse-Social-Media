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
    
    init() {
        super.init(nibName: ApplicationConstants.splashVC.nibName, bundle: nil)
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter?.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        presenter?.viewWillAppear()
    }
    
    private func setupButtonView(button:UIButton, title: String) {
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = UIFont.buttonTitleFont
        button.setTitleColor(UIColor.buttonTitleColour, for: .normal)
        button.backgroundColor = UIColor.buttonBGColour
        button.roundCorners(size: CGFloat(10).ws)
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

extension SplashViewController : PSplashPresenterToView {

    func setupViews() {
        titleLabel.text = "Welcome to Diverse Social Media Application".localized
        titleLabel.font = UIFont.titleFont
        titleLabel.textColor = UIColor.titleColour
        
        setupButtonView(button: loginButton, title: "Login".localized.returnWithMargin)
        setupButtonView(button: registerButton, title: "Register".localized.returnWithMargin)
        
        languageImageView.image = UIImage(named: "")
        languageLabel.text = ""
        languageLabel.font = UIFont.textFont
        languageLabel.textColor = UIColor.textColour
    }
    
    func setNavBar() {
        setNavigationBarItems(title: "", leftButton: nil, rightButton: nil, containerColour: UIColor.navbarBGColour)
    }
    
    func setLanguage(language: String) {
        languageImageView.image = UIImage(named: language)
        languageLabel.text = language
    }
    
    func setGestureRecognizerForLanguage() {
        let tapGestureRec = UITapGestureRecognizer(target: self, action: #selector(self.languageClicked(sender:)))
        languageImageView.addGestureRecognizer(tapGestureRec)
        languageLabel.addGestureRecognizer(tapGestureRec)
    }
}
