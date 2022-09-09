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
    @IBOutlet private weak var languageTextField: UITextField!
    
    public var presenter: SplashPresenter?
    
    private var pickerIndex: Int = 0
    
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
    
    @objc private func languageSelected(sender: UIButton) {
        presenter?.selectLanguageFromPicker(index: pickerIndex)
    }

    @IBAction private func loginClicked(_ sender: UIButton) {
        presenter?.navigateToLogin()
    }
    
    @IBAction private func registerClicked(_ sender: UIButton) {
        presenter?.navigateToRegister()
    }
}

extension SplashViewController: PSplashPresenterToView {

    func setupViews() {
        titleLabel.text = "Welcome to Diverse Social Media Application".localized
        titleLabel.font = UIFont.titleFont
        titleLabel.textColor = UIColor.titleColour
        
        setupButtonView(button: loginButton, title: "Login".localized.returnWithMargin)
        setupButtonView(button: registerButton, title: "Register".localized.returnWithMargin)
        
        languageImageView.image = UIImage(named: "")
        languageTextField.text = ""
        languageTextField.font = UIFont.textFont
        languageTextField.textColor = UIColor.textColour
        languageTextField.tintColor = UIColor.clear
        languageTextField.delegate = self
    }
    
    func setNavBar() {
        setNavigationBarItems(title: "", leftButton: nil, rightButton: nil, containerColour: UIColor.navbarBGColour)
    }
    
    func setLanguage(language: String) {
        languageImageView.image = UIImage(named: language)
        languageTextField.text = language
    }
    
    func setGestureRecognizerForLanguage() {
        let tapGestureRec = UITapGestureRecognizer(target: self, action: #selector(self.languageClicked(sender:)))
        languageImageView.isUserInteractionEnabled = true
        languageImageView.addGestureRecognizer(tapGestureRec)
    }
    
    func setupPicker() {
        let pickerView = UIPickerView(frame:CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: CGFloat(180).ws))
        pickerView.delegate = self
        pickerView.dataSource = self
        pickerView.backgroundColor = UIColor.viewBGColour
        pickerView.selectRow(pickerIndex, inComponent: 0, animated: true)
        languageTextField.inputView = pickerView
        
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.backgroundColor = UIColor.buttonBGColour
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor.buttonTitleColour
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Select".localized, style: .done, target: self, action: #selector(languageSelected))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let languageLabel = UIBarButtonItem(title: "Select your language".localized, style: .plain, target: nil, action: nil)
        toolBar.setItems([languageLabel, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        languageTextField.inputAccessoryView = toolBar
    }
    
    func becomeFirstResponderLanguageTextField() {
        languageTextField.becomeFirstResponder()
    }
    
    func resignFirstResponderLanguageTextField() {
        languageTextField.resignFirstResponder()
    }
}

extension SplashViewController : UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        presenter?.openLanguagePicker()
    }
}

extension SplashViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return (presenter?.languages.count ?? 0)
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return presenter?.languages[row].languageLongName
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickerIndex = row
    }
}
