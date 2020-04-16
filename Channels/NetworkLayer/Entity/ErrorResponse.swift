//
//  ErrorResponse.swift
//  Monshaat_SMEOwner_IOS
//
//  Created by user on 12/22/19.
//  Copyright © 2019 Ibtikar. All rights reserved.
//

import UIKit

struct ErrorResponse: Codable {

    let message: String?

    enum CodingKeys: String, CodingKey {
        case message
    }
    
    init(from decoder: Decoder) throws {
        
        let values = try decoder.container(keyedBy: CodingKeys.self)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        
    }

}
