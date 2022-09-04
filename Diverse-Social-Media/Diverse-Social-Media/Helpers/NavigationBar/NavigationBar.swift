//
//  NavigationBar.swift
//  Diverse-Social-Media
//
//  Created by Oguzhan Yalcin on 28.08.2022.
//

import Foundation
import UIKit

enum NavigationBarButtonType {
    case back
    case close

    var textForImage: String {
        switch self {
        case .back:
            return "<-"
        case .close:
            return "X"
        }
    }
}

protocol NavigationBarDelegate: AnyObject {
    func handleNavigationBarButton(type: NavigationBarButtonType)
}

class NavigationBar: UIView {
    
    @IBOutlet private weak var containerView: UIView!
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var leftButton: UIButton!
    @IBOutlet private weak var rightButton: UIButton!
    
    public weak var delegate: NavigationBarDelegate?
    
    public var title: String? {
        didSet {
            titleLabel.isHidden = true
            if let titleText = title {
                titleLabel.isHidden = false
                titleLabel.text = titleText
                titleLabel.font = UIFont.navbarTitleFont
                titleLabel.textColor = UIColor.navbarTitleColour
            }
        }
    }
    
    public var leftButtonType: NavigationBarButtonType? {
        didSet {
            leftButton.isHidden = true
            if let buttonType = leftButtonType {
                leftButton.isHidden = false
                leftButton.setTitle(buttonType.textForImage, for: .normal)
                leftButton.titleLabel?.font = UIFont.navbarTitleFont
                leftButton.setTitleColor(UIColor.navbarTitleColour, for: .normal)
            }
        }
    }

    public var rightButtonType: NavigationBarButtonType? {
        didSet {
            rightButton.isHidden = true
            if let buttonType = rightButtonType {
                rightButton.isHidden = false
                rightButton.setTitle(buttonType.textForImage, for: .normal)
                rightButton.titleLabel?.font = UIFont.navbarTitleFont
                rightButton.setTitleColor(UIColor.navbarTitleColour, for: .normal)
            }
        }
    }
    
    public var containerBGColour: UIColor? {
        didSet { containerView.backgroundColor = containerBGColour ?? UIColor.clear }
    }
    
    @IBAction private func leftButtonClicked(_ sender: UIButton) {
        guard let buttonType = leftButtonType else { return }

        delegate?.handleNavigationBarButton(type: buttonType)
    }
    
    @IBAction private func rightButtonClicked(_ sender: UIButton) {
        guard let buttonType = rightButtonType else { return }

        delegate?.handleNavigationBarButton(type: buttonType)
    }
}
