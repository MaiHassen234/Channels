//
//  NetworkError.swift
//  Monshaat_SMEOwner_IOS
//
//  Created by Mai on 11/24/19.
//  Copyright © 2019 Ibtikar. All rights reserved.
//

import UIKit
import Moya

enum `Type`: String, Codable {
    case business
    case system
    case mapping
}

struct NetworkError: Codable, Error {

    //enum (busineess , system , mapping) will know from moya error by (type / status code)
    var code: Int?
    var message: String?
    var type: Type?
    var errorResponse: ErrorResponse?
    //    var userInfo: [String: Any] = [:]
    
    enum CodingKeys: String, CodingKey {
        
        case errorResponse = "error"
        case code = "status"
        
    }
    
    init() {
        
    }

    init(from decoder: Decoder) throws {
        
        let values = try decoder.container(keyedBy: CodingKeys.self)
        errorResponse = try values.decodeIfPresent(ErrorResponse.self, forKey: .errorResponse)
        self.code = try values.decodeIfPresent(Int.self, forKey: .code)
        self.type = Type.mapping
        self.message = errorResponse?.message
        
    }

    init(error: MoyaError) {
        self.code = error.errorCode
        self.message = error.errorDescription

        switch error {
        case .underlying(let error, _):
            self.type = .system
            print(error)
        //            userInfo["error"] = error
        default :
            self.type = .mapping
        }
    }
}

extension NetworkError {
    static let parseError: NetworkError = {
        var error = NetworkError()
        error.type = Type.mapping
        return error
    }()

}
