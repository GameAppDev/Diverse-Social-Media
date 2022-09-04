//
//  Models.swift
//  Diverse-Social-Media
//
//  Created by Oguzhan Yalcin on 4.09.2022.
//

import Foundation
import Alamofire

enum ApiState {
    case beforeRequest
    case loading
    case success
    case failure
}

struct BaseResponse<T : Codable> {
    var model: T?
    var message: String?
}

class BaseError {
    
    var errorMessage: String?
    var statusCode: Int?
    var debugMessage: String?
    
    init(_ afError : AFError?) {
        debugMessage = afError.debugDescription
        statusCode = afError?.responseCode
        errorMessage = afError?.errorDescription
    }
}
