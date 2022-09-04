//
//  NetworkManager.swift
//  Diverse-Social-Media
//
//  Created by Oguzhan Yalcin on 4.09.2022.
//

import Foundation
import Alamofire

typealias Success<T : Codable> = (BaseResponse<T>) -> Void
typealias Error = (BaseError) -> Void

class NetworkManager: Networkable {
    
    private let baseUrl: String = ApplicationConstants.baseUrl

    public func get<T: Codable>(path: String, _ paramaters: [String: String]?, onSuccess: @escaping Success<T>, onError: @escaping Error) {
        AF.request(networkRequestUrlWith(path), method: .get, parameters: paramaters).validate().responseDecodable(of: T.self) { (response) in
            guard let model = response.value else {
                onError(BaseError(response.error))
                return
            }
            onSuccess(BaseResponse.init(model: model, message: "Success"))
        }
    }
}

extension NetworkManager {
    
    private func networkRequestUrlWith(_ path: String) -> String {
        return baseUrl + "/" + path
    }
}
