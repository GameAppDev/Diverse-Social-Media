//
//  Colours.swift
//  Diverse-Social-Media
//
//  Created by Oguzhan Yalcin on 21.08.2022.
//

import UIKit

extension UIColor {
    
    static let navbarBGColour    = ThemeManager().getThemeColourFor(item: .NavBarBG)
    static let navbarTitleColour = ThemeManager().getThemeColourFor(item: .NavBarTitle)
    static let buttonBGColour    = ThemeManager().getThemeColourFor(item: .ButtonBG)
    static let buttonTitleColour = ThemeManager().getThemeColourFor(item: .ButtonTitle)
    static let textColour        = ThemeManager().getThemeColourFor(item: .Text)
    static let titleColour       = ThemeManager().getThemeColourFor(item: .Title)
    static let viewBGColour      = ThemeManager().getThemeColourFor(item: .ViewBG)
}
