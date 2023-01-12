//
//  SplashViewController.swift
//  Diverse-Social-Media
//
//  Created by Oguzhan Yalcin on 8.09.2022.
//

import UIKit

final class SplashViewController: BaseViewController {

    // MARK: - Outlets
    @IBOutlet private weak var titleLabel: UILabel!
    
    @IBOutlet private weak var loginButton: UIButton!
    @IBOutlet private weak var registerButton: UIButton!
    
    @IBOutlet private weak var languageImageView: UIImageView! {
        didSet {
            let tapGestureRec = UITapGestureRecognizer(target: self, action: #selector(languageImageViewClicked))
            languageImageView.addGestureRecognizer(tapGestureRec)
        }
    }
    @IBOutlet private weak var languageTextField: UITextField!
    
    var presenter: PSplashViewToPresenter?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter?.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        presenter?.viewWillAppear()
    }
    
    // MARK: - Actions
    @objc private func languageImageViewClicked() {
        presenter?.handleLanguagePicker()
    }
    
    @IBAction private func loginClicked(_ sender: UIButton) {
        presenter?.handleLogin()
    }
    
    @IBAction private func registerClicked(_ sender: UIButton) {
        presenter?.handleRegister()
    }
}

extension SplashViewController: PSplashPresenterToView {

    // MARK: - NavBar
    func setNavBar(title: String) {
        setNavigationBarItems(title: title,
                              leftButton: nil,
                              rightButton: nil)
    }
    
    // MARK: - titleLabel
    func setTitle(text: String) {
        titleLabel.text = text
    }
    
    func setTitle(font: UIFont) {
        titleLabel.font = font
    }
    
    func setTitle(colour: UIColor) {
        titleLabel.textColor = colour
    }
    
    // MARK: - loginButton
    func setLoginButton(title: String) {
        loginButton.setTitle(title, for: .normal)
    }
    
    func setLoginButton(font: UIFont) {
        loginButton.titleLabel?.font = font
    }
    
    func setLoginButton(bgColour: UIColor, titleColour: UIColor) {
        loginButton.setTitleColor(UIColor.buttonTitleColour, for: .normal)
        loginButton.backgroundColor = UIColor.buttonBGColour
    }
    
    func setLoginButton(roundCornersSize: CGFloat) {
        loginButton.roundCorners(size: roundCornersSize)
    }
    
    // MARK: - registerButton
    func setRegisterButton(title: String) {
        registerButton.setTitle(title, for: .normal)
    }
    
    func setRegisterButton(font: UIFont) {
        registerButton.titleLabel?.font = font
    }
    
    func setRegisterButton(bgColour: UIColor, titleColour: UIColor) {
        registerButton.setTitleColor(UIColor.buttonTitleColour, for: .normal)
        registerButton.backgroundColor = UIColor.buttonBGColour
    }
    
    func setRegisterButton(roundCornersSize: CGFloat) {
        registerButton.roundCorners(size: roundCornersSize)
    }
    
    // MARK: - languageImageView
    func setLanguageImageView(image: String) {
        languageImageView.image = UIImage(named: image)
    }
    
    // MARK: - languageTextField
    func setLanguageTextField(text: String) {
        languageTextField.text = text
    }
    
    func setLanguageTextField(font: UIFont) {
        languageTextField.font = font
    }
    
    func setLanguageTextField(textColour: UIColor, tintColor: UIColor) {
        languageTextField.textColor = textColour
        languageTextField.tintColor = tintColor
    }
    
    // MARK: - PickerView
    func setPickerView() {
        // TODO: - PickerView will be added.
    }
}
