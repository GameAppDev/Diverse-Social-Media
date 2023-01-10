//
//  PopupBuilder.swift
//  Diverse-Social-Media
//
//  Created by Oguzhan Yalcin on 10.01.2023.
//

import UIKit

enum PopupButtonType {
    case single
    case double
}

struct PopupSettings {
    var id: String?
    var title: String?
    var content: String?
    var imageName: String?
    var buttonType: PopupButtonType = .single
    var leftButtonText: String?
    var rightButtonText: String?
    var dismissAfterButtonClicked: Bool = true

    func show(parentVC: UIViewController,
              buttonActions: PopupButtonDelegate?,
              dismissDelegate: PopupDismissDelegate? = nil) {
        let viewController = PopupRouter.setupModule(popupSettings: self,
                                                     buttonActions: buttonActions,
                                                     dismissDelegate: dismissDelegate)
        parentVC.present(viewController, animated: false)
    }
}

final class PopupBuilder {
    
    private var popup = PopupSettings()

    // MARK: - Builder
    public func setPopupIdentifier(_ id: String) -> PopupBuilder {
        popup.id = id
        return self
    }

    public func setTitle(_ title: String) -> PopupBuilder {
        popup.title = title
        return self
    }

    public func setContent(_ content: String?) -> PopupBuilder {
        popup.content = content
        return self
    }

    public func setImageName(_ imageName: String) -> PopupBuilder {
        popup.imageName = imageName
        return self
    }
    
    public func setButtonType(_ buttonType: PopupButtonType) -> PopupBuilder {
        popup.buttonType = buttonType
        return self
    }

    public func setLeftButtonText(_ leftButtonText: String?) -> PopupBuilder {
        popup.leftButtonText = leftButtonText
        return self
    }
    
    public func setRightButtonText(_ rightButtonText: String?) -> PopupBuilder {
        popup.rightButtonText = rightButtonText
        return self
    }

    public func setDismissAfterPrimaryButtonClick(_ dismissAfterButtonClicked: Bool) -> PopupBuilder {
        popup.dismissAfterButtonClicked = dismissAfterButtonClicked
        return self
    }
    
    public func build() -> PopupSettings {
        return popup
    }
}
