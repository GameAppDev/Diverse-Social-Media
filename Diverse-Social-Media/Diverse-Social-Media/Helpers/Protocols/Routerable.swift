//
//  Routerable.swift
//  Diverse-Social-Media
//
//  Created by Oguzhan Yalcin on 4.09.2022.
//

import UIKit

protocol Routerable {
    
    var navigationController: UINavigationController? { get set }

    func pushVC(_ vc:UIViewController, animated: Bool)
    func presentVC(_ vc:UIViewController, animated: Bool)
    func dismissVC(animated: Bool)
    func popVC(animated: Bool)
}

extension Routerable {
    
    func pushVC(_ vc:UIViewController, animated: Bool) {
        navigationController?.pushViewController(vc, animated: animated)
    }
    
    func presentVC(_ vc:UIViewController, animated: Bool) {
        navigationController?.present(vc, animated: animated)
    }
    
    func dismissVC(animated: Bool) {
        navigationController?.dismiss(animated: animated)
    }
    
    func popVC(animated: Bool) {
        navigationController?.popViewController(animated: animated)
    }
}

