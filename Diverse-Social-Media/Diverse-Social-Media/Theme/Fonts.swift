//
//  Fonts.swift
//  Diverse-Social-Media
//
//  Created by Oguzhan Yalcin on 21.08.2022.
//

import UIKit

extension UIFont {
    
    static let navbarTitleFont = ThemeManager().getThemeFontFor(item: .NavBarTitle)
    static let buttonTitleFont = ThemeManager().getThemeFontFor(item: .ButtonTitle)
    static let textFont        = ThemeManager().getThemeFontFor(item: .Text)
    static let titleFont       = ThemeManager().getThemeFontFor(item: .Title)
}
