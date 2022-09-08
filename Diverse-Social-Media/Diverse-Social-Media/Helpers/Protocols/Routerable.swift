//
//  Routerable.swift
//  Diverse-Social-Media
//
//  Created by Oguzhan Yalcin on 4.09.2022.
//

import UIKit

protocol Routerable {
    
    //var navigationController: UINavigationController? { get set }

    func pushVC(_ vc:UIViewController, navController: UINavigationController?, animated: Bool)
    func presentVC(_ vc:UIViewController, navController: UINavigationController?, animated: Bool)
    //func dismissVC(animated: Bool)
    //func popVC(animated: Bool)
}

extension Routerable {
    
    func pushVC(_ vc:UIViewController, navController: UINavigationController?, animated: Bool) {
        navController?.pushViewController(vc, animated: animated)
    }
    
    func presentVC(_ vc:UIViewController, navController: UINavigationController?, animated: Bool) {
        navController?.present(vc, animated: animated)
    }
}

