//
//  UICollectionView+Ext.swift
//  Diverse-Social-Media
//
//  Created by Oguzhan Yalcin on 6.09.2022.
//

import UIKit

extension UICollectionView {

    func registerCell<T: UICollectionReusableView>(_ cell: T.Type) {
        register(nibFromClass(cell), forCellWithReuseIdentifier: cell.className)
    }
    
    func registerHeaderCell<T: UICollectionReusableView>(_ cell: T.Type) {
        register(nibFromClass(cell), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: cell.className)
    }
    
    func registerFooterCell<T: UICollectionReusableView>(_ cell: T.Type) {
        register(nibFromClass(cell), forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: cell.className)
    }
    
    fileprivate func nibFromClass(_ type: UICollectionReusableView.Type) -> UINib {
        return UINib(nibName: type.className, bundle: nil)
    }
}
