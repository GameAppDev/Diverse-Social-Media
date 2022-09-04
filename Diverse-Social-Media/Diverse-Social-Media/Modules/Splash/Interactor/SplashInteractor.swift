//
//  SplashInteractor.swift
//  Diverse-Social-Media
//
//  Created by Oguzhan Yalcin on 2.09.2022.
//

import Foundation

final class SplashInteractor: Interactorable {
    
    private var networkManager: Networkable?
    public weak var presenter: SplashPresenter?
    
    private var userDefaults = UserDefaults.standard
    
    public var apiState: ApiState = .beforeRequest
    
    public func getUserDefaultsStringValueOf(_ forkey: String) -> String? {
        return userDefaults.string(forKey: forkey)
    }
}

extension SplashInteractor: PSplashPresenterToInteractor {
    
    func fetchConfigData() {
        networkManager?.get(path: "test/config.com", nil, onSuccess: { (response: BaseResponse<Config>) in
            guard let data = response.model else { return }
            
            self.presenter?.onSuccessConfig(response: data)
        }) { (error) in
            self.presenter?.onErrorConfig(error: error)
        }
    }
}
