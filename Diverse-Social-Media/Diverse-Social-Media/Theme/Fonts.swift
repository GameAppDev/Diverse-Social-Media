//
//  Fonts.swift
//  Diverse-Social-Media
//
//  Created by Oguzhan Yalcin on 21.08.2022.
//

import UIKit

extension UIFont {
    
    static let navbarTitleFont = ThemeManager.shared.getThemeFontFor(item: .NavBarTitle)
    static let buttonTitleFont = ThemeManager.shared.getThemeFontFor(item: .ButtonTitle)
    static let textFont        = ThemeManager.shared.getThemeFontFor(item: .Text)
    static let titleFont       = ThemeManager.shared.getThemeFontFor(item: .Title)
}
