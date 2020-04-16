//
//  Categories.swift
//  Channels
//
//  Created by Mai hassen on 4/11/20.
//  Copyright © 2020 Mai hassen. All rights reserved.
//

import Foundation

struct Categories: Codable, Hashable {
    let name: String?
    enum CodingKeys: String, CodingKey {
        case name
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decodeIfPresent(String.self, forKey: .name)
    }
}
