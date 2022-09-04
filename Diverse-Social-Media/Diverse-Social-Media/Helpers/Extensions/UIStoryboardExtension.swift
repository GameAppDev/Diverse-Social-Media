//
//  UIStoryboardExtension.swift
//  Diverse-Social-Media
//
//  Created by Oguzhan Yalcin on 2.09.2022.
//

import Foundation
import UIKit

extension UIStoryboard {
    
    static func loadViewController(storyboardName: String, storyboardIdentifier: String) -> UIViewController? {
        return UIStoryboard(name: storyboardName, bundle: nil).instantiateViewController(withIdentifier: storyboardIdentifier)
    }
}
