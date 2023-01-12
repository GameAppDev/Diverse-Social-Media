//
//  UINavigationController+Ext.swift
//  Diverse-Social-Media
//
//  Created by Oguzhan Yalcin on 12.01.2023.
//

import UIKit

extension UINavigationController {
    
    var rootViewController: UIViewController {
        return self.viewControllers.first!
    }
    
    func push(_ vc: UIViewController) {
        self.pushViewController(vc, animated: true)
    }
}
