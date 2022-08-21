//
//  Colours.swift
//  Diverse-Social-Media
//
//  Created by Oguzhan Yalcin on 21.08.2022.
//

import UIKit

extension UIColor {
    
    static let navbarBGColour    = ThemeManager().getThemeColourFor(item: .NavBarBG, defaultColour: UIColor.darkGray)
    static let navbarTitleColour = ThemeManager().getThemeColourFor(item: .NavBarTitle, defaultColour: UIColor.white)
    static let buttonBGColour    = ThemeManager().getThemeColourFor(item: .ButtonBG, defaultColour: UIColor.darkGray)
    static let buttonTitleColour = ThemeManager().getThemeColourFor(item: .ButtonTitle, defaultColour: UIColor.white)
    static let titleColour       = ThemeManager().getThemeColourFor(item: .Title, defaultColour: UIColor.red)
    static let textColour        = ThemeManager().getThemeColourFor(item: .Text, defaultColour: UIColor.white)
    static let viewBGColour      = ThemeManager().getThemeColourFor(item: .ViewBG, defaultColour: UIColor.lightGray)
}
