//
//  PickerEntities.swift
//  Diverse-Social-Media
//
//  Created by Oguzhan Yalcin on 12.01.2023.
//

import Foundation

struct PickerData {
    init(delegate: PickerDelegate? = nil,
         title: String,
         buttonTitle: String,
         selectedIndex: Int = -1,
         data: [String]) {
        self.delegate = delegate
        self.title = title
        self.buttonTitle = buttonTitle
        self.selectedIndex = selectedIndex
        self.data = data
    }
    weak var delegate: PickerDelegate?
    let title: String
    let buttonTitle: String?
    let selectedIndex: Int
    let data: [String]
}
