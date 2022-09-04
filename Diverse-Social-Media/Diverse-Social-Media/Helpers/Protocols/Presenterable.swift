//
//  Presenterable.swift
//  Diverse-Social-Media
//
//  Created by Oguzhan Yalcin on 4.09.2022.
//

import Foundation

protocol Presenterable {
    associatedtype V: Viewable
    associatedtype I: Interactorable
    associatedtype R: Routerable
    
    var dependencies: (view: V, router: R, interactor: I) { get }
}

