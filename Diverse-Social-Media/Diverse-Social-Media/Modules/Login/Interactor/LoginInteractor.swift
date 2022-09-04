//
//  LoginInteractor.swift
//  Diverse-Social-Media
//
//  Created by Oguzhan Yalcin on 2.09.2022.
//

import Foundation

final class LoginInteractor: Interactorable {
    
    private var networkManager: Networkable?
    public weak var presenter: LoginPresenter?
    
    public var apiState: ApiState = .beforeRequest
}

extension LoginInteractor: PLoginPresenterToInteractor {
    
    func fetchUserData(username: String, password: String) {
        //Core Data will be used...
        let user: User = User(userId: "1234", userType: .CaptanAmerica, firstName: "Steve", lastName: "Rogers", email: "steve.rogers@mail.com", characterPhoto: "CaptanAmerica", about: "Captain America is a superhero appearing in American comic books published by Marvel Comics. Created by cartoonists Joe Simon and Jack Kirby")
        self.presenter?.onSuccessLogin(response: user)
    }
    
    func setUserModel(user: User) {
        var model:[String: Any] = [:]
        model["userType"] = user.userType
        model["firstName"] = user.firstName
        model["lastName"] = user.lastName
        model["email"] = user.email
        model["characterPhoto"] = user.characterPhoto
        model["about"] = user.about
        
        UserManager.shared.setUserModel(model: model)
    }
}
