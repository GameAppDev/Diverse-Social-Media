//
//  UITableViewExtension.swift
//  Diverse-Social-Media
//
//  Created by Oguzhan Yalcin on 21.08.2022.
//

import UIKit

extension UITableView {
    
    func registerCellWith(identifier:String) {
        self.register(UINib(nibName: identifier, bundle: nil), forCellReuseIdentifier: identifier)
        self.tableFooterView = UIView()
        self.rowHeight = UITableView.automaticDimension
        self.separatorStyle = .none
    }
}
