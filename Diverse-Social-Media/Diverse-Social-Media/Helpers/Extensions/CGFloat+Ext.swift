//
//  CGFloat+Ext.swift
//  Diverse-Social-Media
//
//  Created by Oguzhan Yalcin on 21.08.2022.
//

import UIKit

extension CGFloat {
    
    var ws: CGFloat {
        return (self / 320) * UIScreen.main.bounds.width
    }
    
    var hs: CGFloat {
        return (self / 568) * UIScreen.main.bounds.height
    }
}
