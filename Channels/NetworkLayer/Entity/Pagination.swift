//
//  Pagination.swift
//  Monshaat_SMEOwner_IOS
//
//  Created by Mai on 12/4/19.
//  Copyright © 2019 Ibtikar. All rights reserved.
//

import Foundation

struct Pagination: Codable {
    let count: Int?
    let total: Int?
    let perPage: Int?
    let currentPage: Int?
    let totalPages: Int?
    // let links: [String]?

    enum CodingKeys: String, CodingKey {

        case count
        case total
        case perPage
        case currentPage
        case totalPages
        //  case links
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        count = try values.decodeIfPresent(Int.self, forKey: .count)
        total = try values.decodeIfPresent(Int.self, forKey: .total)
        perPage = try values.decodeIfPresent(Int.self, forKey: .perPage)
        currentPage = try values.decodeIfPresent(Int.self, forKey: .currentPage)
        totalPages = try values.decodeIfPresent(Int.self, forKey: .totalPages)
        //   links = try values.decodeIfPresent([String].self, forKey: .links)
    }

}
