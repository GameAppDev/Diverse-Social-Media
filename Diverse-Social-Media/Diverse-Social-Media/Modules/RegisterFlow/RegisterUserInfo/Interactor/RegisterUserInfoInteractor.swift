//
//  RegisterUserInfoInteractor.swift
//  Diverse-Social-Media
//
//  Created by Oguzhan Yalcin on 7.09.2022.
//

import Foundation

final class RegisterUserInfoInteractor: Interactorable {
    
    private var networkManager: Networkable?
    public weak var presenter: RegisterUserInfoPresenter?
    
    public var apiState: ApiState = .beforeRequest
}
