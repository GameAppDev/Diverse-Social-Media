//
//  UserTypeConfig.swift
//  Diverse-Social-Media
//
//  Created by Oguzhan Yalcin on 6.09.2022.
//

import Foundation

enum UserType {
    case CaptanAmerica
    case IronMan
    case Hulk
    case BlackPanther
    case Guest
}

struct UserTypeConfig {
    
    private var captanAmerica = UserTypeItems(type: .CaptanAmerica, name: "Captain America", image: "CaptainAmerica", info: "", isSelected: false)
    private var ironMan = UserTypeItems(type: .IronMan, name: "Iron Man", image: "IronMan", info: "", isSelected: false)
    private var hulk = UserTypeItems(type: .Hulk, name: "Hulk", image: "Hulk", info: "", isSelected: false)
    private var blackPanther = UserTypeItems(type: .BlackPanther, name: "Black Panther", image: "BlackPanther", info: "", isSelected: false)
    
    public func getUserTypes() -> [UserTypeItems] {
        return [self.captanAmerica, self.ironMan, self.hulk, self.blackPanther]
    }
    
     public func getUserTypeCount() -> Int {
        return getUserTypes().count
    }
}

struct UserTypeItems {
    let type: UserType
    let name: String
    let image: String
    let info: String
    var isSelected: Bool
}
