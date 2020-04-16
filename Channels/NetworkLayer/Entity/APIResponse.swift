//
//  ApiResponsePagenation.swift
//  Monshaat_SMEOwner_IOS
//
//  Created by Mai on 12/4/19.
//  Copyright © 2019 Ibtikar. All rights reserved.
//

struct APIResponse<T: Codable>: Codable {

    let status: Int?
    let success: Bool?
    let data: T?
    let pagination: Pagination?

    enum CodingKeys: String, CodingKey {
        case status
        case success
        case data
        case pagination
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(Int.self, forKey: .status)
        success = try values.decodeIfPresent(Bool.self, forKey: .success)
        data = try values.decodeIfPresent(T.self, forKey: .data)
        pagination = try values.decodeIfPresent(Pagination.self, forKey: .pagination)
    }

}
