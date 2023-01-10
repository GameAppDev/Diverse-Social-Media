//
//  Colours.swift
//  Diverse-Social-Media
//
//  Created by Oguzhan Yalcin on 21.08.2022.
//

import UIKit

extension UIColor {
    
    static let navbarBGColour    = ThemeManager.shared.getThemeColourFor(item: .NavBarBG)
    static let navbarTitleColour = ThemeManager.shared.getThemeColourFor(item: .NavBarTitle)
    static let buttonBGColour    = ThemeManager.shared.getThemeColourFor(item: .ButtonBG)
    static let buttonTitleColour = ThemeManager.shared.getThemeColourFor(item: .ButtonTitle)
    static let textColour        = ThemeManager.shared.getThemeColourFor(item: .Text)
    static let titleColour       = ThemeManager.shared.getThemeColourFor(item: .Title)
    static let viewBGColour      = ThemeManager.shared.getThemeColourFor(item: .ViewBG)
}
