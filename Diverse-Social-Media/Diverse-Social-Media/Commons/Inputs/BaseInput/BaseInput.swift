//
//  BaseInput.swift
//  Diverse-Social-Media
//
//  Created by Oguzhan Yalcin on 12.01.2023.
//

import UIKit

enum InputState {
    case notReady
    case notValid
    case valid
}

enum InputValidationType {
    case email
    case password
}

@objc protocol InputDelegate: AnyObject {
    @objc optional func textFieldDidChange(_ view: BaseInput)
    @objc optional func textFieldDidEndEditing(_ view: BaseInput)
}

@IBDesignable
class BaseInput: UIView, Validatable {
    
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var headerLabel: UILabel!
    @IBOutlet private weak var baseTextFieldView: UIView!
    @IBOutlet private weak var baseTextField: UITextField!
    
    @IBInspectable var headerText: String? {
        get { return headerLabel.text }
        set { headerLabel.text = newValue }
    }
    
    @IBInspectable var headerFont: UIFont? {
        get { return headerLabel.font }
        set { headerLabel.font = newValue }
    }
    
    @IBInspectable var headerTextColour: UIColor? {
        get { return headerLabel.textColor }
        set { headerLabel.textColor = newValue }
    }
    
    @IBInspectable var baseText: String? {
        get { return baseTextField.text }
        set { baseTextField.text = newValue }
    }
    
    @IBInspectable var baseFont: UIFont? {
        get { return baseTextField.font }
        set { baseTextField.font = newValue }
    }
    
    @IBInspectable var baseTextColour: UIColor? {
        get { return baseTextField.textColor }
        set { baseTextField.textColor = newValue }
    }
    
    @IBInspectable var placeholder: String? {
        get { return baseTextField.placeholder }
        set { baseTextField.placeholder = newValue?.localized }
    }
    
    var keyboardType: UIKeyboardType { return UIKeyboardType.default }
    
    var secureTextEntry: Bool { return false }
    
    private var state: InputState = .notReady
    
    private weak var inputDelegate: InputDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        let bundle = Bundle(for: BaseInput.self)
        bundle.loadNibNamed(BaseInput.className, owner: self, options: nil)
        addSubview(containerView)
        containerView.frame = self.bounds
        baseTextField.keyboardType = keyboardType
        baseTextField.isSecureTextEntry = secureTextEntry
        self.clipsToBounds = true
        baseTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    }
    
    public func validations() -> [Validation] {
        return [Validation]()
    }
    
    func getState() -> InputState {
        return self.state
    }
    
    private func setInputState(state: InputState) {
        self.state = state
        switch state {
        case .notReady:
            setNotReadyStatus()
        case .notValid:
            setNotValidStatus()
        case .valid:
            setValidStatus()
        }
    }
    
    private func setNotReadyStatus() {
        headerLabel.textColor = UIColor.buttonTitleColour
        baseTextFieldView.setBorder(width: CGFloat(1), color: UIColor.buttonTitleColour)
    }
    
    private func setNotValidStatus() {
        headerLabel.textColor = UIColor.navbarBGColour
        baseTextFieldView.setBorder(width: CGFloat(1), color: UIColor.navbarBGColour)
    }
    
    private func setValidStatus() {
        headerLabel.textColor = UIColor.textColour
        baseTextFieldView.setBorder(width: CGFloat(1), color: UIColor.textColour)
    }
}

extension BaseInput: UITextFieldDelegate {
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        setInputState(state: (self.isValid() == true) ? .valid : .notValid)
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        switch keyboardType {
        case .numberPad, .decimalPad: return string.isNumeric
        default: return true
        }
    }

    func textFieldDidBeginEditing(_ textField: UITextField) {
        setInputState(state: (self.isValid() == true) ? .notReady : .notValid)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        setInputState(state: (self.isValid() == true) ? .valid : .notValid)
    }
}
