//
//  UIViewController+Ext.swift
//  Diverse-Social-Media
//
//  Created by Oguzhan Yalcin on 28.08.2022.
//

import Foundation
import UIKit

extension UIViewController {
    
    //Hide Keyboard
    func hideKeyboardWhenCicked() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
    }

    @objc func hideKeyboard() {
        view.endEditing(true)
    }
    
    //Navigation
    func getNavigationBarFrame() -> CGRect {
        let topSAInsets = navigationController?.view.safeAreaInsets.top ?? 0

        return .init(
            x: 0,
            y: -topSAInsets,
            width: navigationController?.navigationBar.bounds.width ?? 0,
            height: (navigationController?.navigationBar.bounds.height ?? 0) + topSAInsets
        )
    }
}
