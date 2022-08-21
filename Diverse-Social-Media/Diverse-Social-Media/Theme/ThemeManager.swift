//
//  ThemeManager.swift
//  Diverse-Social-Media
//
//  Created by Oguzhan Yalcin on 21.08.2022.
//

import Foundation
import UIKit

enum ThemeItem {
    case NavBarBG
    case NavBarTitle
    case ButtonBG
    case ButtonTitle
    case Title
    case Text
    case ViewBG
}

class ThemeManager {
    
    public func getThemeColourFor(item:ThemeItem, defaultColour:UIColor) -> UIColor {
        let userType:UserType = UserManager.shared.getUserType()
        
        switch userType {
        case .CaptanAmerica:
            return getCaptanAmericaColourFor(item)
        case .IronMan:
            return getIronManColourFor(item)
        case .Hulk:
            return getHulkColourFor(item)
        case .BlackPanther:
            return getBlackPantherColourFor(item)
        case .Guest:
            return defaultColour
        }
    }
    
    private func getCaptanAmericaColourFor(_ item:ThemeItem) -> UIColor {
        switch item {
        case .NavBarBG:
            return UIColor(red: 7/255, green: 77/255, blue: 129/255, alpha: 1)
        case .NavBarTitle:
            return UIColor(red: 225/255, green: 41/255, blue: 43/255, alpha: 1)
        case .ButtonBG:
            return UIColor(red: 7/255, green: 77/255, blue: 129/255, alpha: 1)
        case .ButtonTitle:
            return UIColor(red: 225/255, green: 41/255, blue: 43/255, alpha: 1)
        case .Text:
            return UIColor(red: 225/255, green: 41/255, blue: 43/255, alpha: 1)
        case .Title:
            return UIColor(red: 7/255, green: 77/255, blue: 129/255, alpha: 1)
        case .ViewBG:
            return UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1)
        }
    }
    
    private func getIronManColourFor(_ item:ThemeItem) -> UIColor {
        switch item {
        case .NavBarBG:
            return UIColor(red: 145/255, green: 20/255, blue: 24/255, alpha: 1)
        case .NavBarTitle:
            return UIColor(red: 246/255, green: 244/255, blue: 245/255, alpha: 1)
        case .ButtonBG:
            return UIColor(red: 145/255, green: 20/255, blue: 24/255, alpha: 1)
        case .ButtonTitle:
            return UIColor(red: 246/255, green: 244/255, blue: 245/255, alpha: 1)
        case .Text:
            return UIColor(red: 246/255, green: 244/255, blue: 245/255, alpha: 1)
        case .Title:
            return UIColor(red: 145/255, green: 20/255, blue: 24/255, alpha: 1)
        case .ViewBG:
            return UIColor(red: 216/255, green: 168/255, blue: 110/255, alpha: 1)
        }
    }
    
    private func getHulkColourFor(_ item:ThemeItem) -> UIColor {
        switch item {
        case .NavBarBG:
            return UIColor(red: 98/255, green: 128/255, blue: 78/255, alpha: 1)
        case .NavBarTitle:
            return UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1)
        case .ButtonBG:
            return UIColor(red: 98/255, green: 128/255, blue: 78/255, alpha: 1)
        case .ButtonTitle:
            return UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1)
        case .Text:
            return UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1)
        case .Title:
            return UIColor(red: 98/255, green: 128/255, blue: 78/255, alpha: 1)
        case .ViewBG:
            return UIColor(red: 93/255, green: 81/255, blue: 106/255, alpha: 1)
        }
    }
    
    private func getBlackPantherColourFor(_ item:ThemeItem) -> UIColor {
        switch item {
        case .NavBarBG:
            return UIColor(red: 114/255, green: 78/255, blue: 174/255, alpha: 1)
        case .NavBarTitle:
            return UIColor(red: 167/255, green: 167/255, blue: 167/255, alpha: 1)
        case .ButtonBG:
            return UIColor(red: 114/255, green: 78/255, blue: 174/255, alpha: 1)
        case .ButtonTitle:
            return UIColor(red: 167/255, green: 167/255, blue: 167/255, alpha: 1)
        case .Text:
            return UIColor(red: 167/255, green: 167/255, blue: 167/255, alpha: 1)
        case .Title:
            return UIColor(red: 114/255, green: 78/255, blue: 174/255, alpha: 1)
        case .ViewBG:
            return UIColor(red: 26/255, green: 26/255, blue: 26/255, alpha: 1)
        }
    }
}
