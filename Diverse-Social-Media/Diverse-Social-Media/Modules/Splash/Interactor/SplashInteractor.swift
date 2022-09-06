//
//  SplashInteractor.swift
//  Diverse-Social-Media
//
//  Created by Oguzhan Yalcin on 2.09.2022.
//

import Foundation

final class SplashInteractor: Interactorable {
    
    private var networkManager: Networkable?
    public var presenter: SplashPresenter?
    
    private var userDefaults = UserDefaults.standard
    
    public var apiState: ApiState = .beforeRequest
    
    private let configPath: String = "test/config.com"
    
    public func getUserDefaultsStringValueOf(_ forkey: String) -> String? {
        return userDefaults.string(forKey: forkey)
    }
}

extension SplashInteractor: PSplashPresenterToInteractor {
    
    func fetchConfigData() {
        networkManager?.get(path: configPath, nil, onSuccess: { (response: BaseResponse<Config>) in
            guard let data = response.model else { return }
            debugPrint("<--- Service gets response: \(data) - path: \(self.configPath) --->")
            self.presenter?.onSuccessConfig(response: data)
        }) { (error) in
            debugPrint("<---! Service gets error: \(error) - path: \(self.configPath) !--->")
            self.presenter?.onErrorConfig(error: error)
        }
    }
}
