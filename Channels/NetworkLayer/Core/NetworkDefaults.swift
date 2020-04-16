//
//  NetworkDefaults.swift
//  Monshaat_SMEOwner_IOS
//
//  Created by Mai on 11/24/19.
//  Copyright © 2019 Ibtikar. All rights reserved.
//

import Foundation
struct NetworkDefaults {

    var baseUrl: String = Environment.rootURL
    var apiKey: String = ""
    var language: String = ""

    static var `defaults` : NetworkDefaults {
        let instance = NetworkDefaults()
        return instance
    }

}
