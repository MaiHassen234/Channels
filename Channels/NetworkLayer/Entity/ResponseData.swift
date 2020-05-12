//
//  ResponseData.swift
//  Monshaat_SMEOwner_IOS
//
//  Created by Mai on 12/7/19.
//  Copyright © 2019 Ibtikar. All rights reserved.
//

import Foundation

struct ResponseData<T: Codable> {
    var data: [T]?
    var pagination: Pagination?
    init(data: [T]?, pagination: Pagination?) {
        self.data = data
        self.pagination = pagination
    }
}
