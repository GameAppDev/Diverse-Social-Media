//
//  UIViewExtension.swift
//  Diverse-Social-Media
//
//  Created by Oguzhan Yalcin on 2.09.2022.
//

import UIKit

extension UIView {
    
    public func loadNib<T: UIView>() -> T? {
        let bundle = Bundle(for: type(of: self))
        let nibName = type(of: self).className
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: T.self, options: nil).first as? T
    }
    
    func roundCorners(size:CGFloat) {
        self.layer.cornerRadius = size
        self.clipsToBounds = true
    }
    
    func setBorder(width:CGFloat, color:UIColor) {
        self.layer.borderColor = color.cgColor
        self.layer.borderWidth = width
    }
}
