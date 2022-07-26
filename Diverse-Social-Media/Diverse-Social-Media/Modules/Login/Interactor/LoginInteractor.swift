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
    
    func fetchUserData(loginModel: [String: Any]) {
        //Core Data will be used...
        if let username = loginModel["username"] as? String, let password = loginModel["password"] as? String {
            let user: User = User(userId: "1234", userType: .CaptanAmerica, firstName: "Steve", lastName: "Rogers", email: "steve.rogers@mail.com", characterPhoto: "CaptanAmerica", about: "Captain America is a superhero appearing in American comic books published by Marvel Comics. Created by cartoonists Joe Simon and Jack Kirby")
            self.presenter?.onSuccessLogin(response: user)
        }
    }
    
    func setUserModel(user: User) {
        let model: [String: Any] = [
            "userType": user.userType,
            "firstName": user.firstName,
            "lastName": user.lastName,
            "email": user.email,
            "characterPhoto": user.characterPhoto,
            "about": user.about
        ]
        
        UserManager.shared.setUserModel(model: model)
    }
}
