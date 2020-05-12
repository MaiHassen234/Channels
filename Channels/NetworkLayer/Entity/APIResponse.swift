//
//  ApiResponsePagenation.swift
//  Monshaat_SMEOwner_IOS
//
//  Created by Mai on 12/4/19.
//  Copyright © 2019 Ibtikar. All rights reserved.
//

import Foundation
struct APIResponse<T: Codable>: Codable {
    var status: Int?
    var success: Bool?
    var data: T?
    var error: NetworkError?
    
    enum CodingKeys: String, CodingKey {

        case status
        case success
        case data
        case error
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(Int.self, forKey: .status)
        success = try values.decodeIfPresent(Bool.self, forKey: .success)
        data = try values.decodeIfPresent(T.self, forKey: .data)
        error = try values.decodeIfPresent(NetworkError.self, forKey: .error)
    }
}
