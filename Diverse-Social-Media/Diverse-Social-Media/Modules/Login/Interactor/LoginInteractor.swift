//
//  LoginInteractor.swift
//  Diverse-Social-Media
//
//  Created by Oguzhan Yalcin on 2.09.2022.
//

import Foundation

final class LoginInteractor {
    
    public weak var presenter: LoginPresenter?
}

extension LoginInteractor: PLoginPresenterToInteractor {
    
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
    
    // MARK: - PresenterToRouter
    func fetchData<T>(request: T) {
        if let loginModel = request as? [String: Any],
           let username = loginModel["username"] as? String,
           let password = loginModel["password"] as? String {
            let user: User = User(userId: "1234", userType: .CaptanAmerica, firstName: "Steve", lastName: "Rogers", email: "steve.rogers@mail.com", characterPhoto: "CaptanAmerica", about: "Captain America is a superhero appearing in American comic books published by Marvel Comics. Created by cartoonists Joe Simon and Jack Kirby")
            self.presenter?.setData(data: user)
        }
    }
}
