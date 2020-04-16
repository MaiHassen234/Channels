//
//  StaticHeaderPlugin.swift
//  Monshaat_SMEOwner_IOS
//
//  Created by Mai on 11/27/19.
//  Copyright © 2019 Ibtikar. All rights reserved.
//

import Foundation
import Moya

public struct StaticHeaderPlugin: PluginType {

    var headers: [String: String] = [:]
    public init(headers: [String: String]) {
        self.headers = headers
    }

    public func prepare(_ request: URLRequest, target: TargetType) -> URLRequest {
        var request = request

        headers.forEach { (key, value) in
            request.addValue(value, forHTTPHeaderField: key)
        }

        return request
    }
}
