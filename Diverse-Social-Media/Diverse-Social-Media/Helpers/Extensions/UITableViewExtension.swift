//
//  UITableViewExtension.swift
//  Diverse-Social-Media
//
//  Created by Oguzhan Yalcin on 21.08.2022.
//

import UIKit

extension UITableView {
    
    func registerCell<T: UITableViewCell>(_ cell: T.Type) {
        register(nibFromClass(cell), forCellReuseIdentifier: cell.className)
    }

    func registerFooterView<T: UITableViewHeaderFooterView>(_ cell: T.Type) {
        register(nibFromClass(cell), forHeaderFooterViewReuseIdentifier: cell.className)
    }
    
    fileprivate func nibFromClass(_ type: UIView.Type) -> UINib {
        return UINib(nibName: type.className, bundle: nil)
    }
}
