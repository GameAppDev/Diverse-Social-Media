//
//  RegisterUserTypeInteractor.swift
//  Diverse-Social-Media
//
//  Created by Oguzhan Yalcin on 6.09.2022.
//

import Foundation

final class RegisterUserTypeInteractor: Interactorable {
    
    private var networkManager: Networkable?
    public weak var presenter: RegisterUserTypePresenter?
    
    public var apiState: ApiState = .beforeRequest
}
