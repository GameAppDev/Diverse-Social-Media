//
//  Networkable.swift
//  Diverse-Social-Media
//
//  Created by Oguzhan Yalcin on 4.09.2022.
//

import Foundation

protocol Networkable {
    func get<T : Codable>(path: String, _ paramaters: [String: String]?, onSuccess: @escaping (BaseResponse<T>) -> Void, onError: @escaping (BaseError) -> Void)
}
