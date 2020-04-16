//
//  NetworkManager.swift
//  Monshaat_SMEOwner_IOS
//
//  Created by Mai on 11/24/19.
//  Copyright © 2019 Ibtikar. All rights reserved.
//

import Foundation
import Moya
import Alamofire
/// Closure to be executed when a request has completed.
typealias StatusCode = Int

class NetworkManager {

    var applicationCoordinator: ApplicationCoordinator?
    
    static var shared: NetworkManager = {
        NetworkManager(config: .defaults)
    }()

    var networkConfig: NetworkDefaults!

    static var reachability: Bool {
        let networkReachability = NetworkReachabilityManager(host: "www.apple.com")
        return networkReachability?.isReachable ?? false
    }

    let provider: MoyaProvider<MultiTarget>

    init(config: NetworkDefaults = NetworkDefaults.defaults) {
        self.networkConfig = config

        let headerPlugin = StaticHeaderPlugin(headers: [:])
        //NetworkLoggerPlugin.Configuration.LogOptions.verbose
        provider = MoyaProvider<MultiTarget>(//manager:,
            plugins: [headerPlugin,
                      NetworkLoggerPlugin(configuration: .init( logOptions: .verbose)),
                      MoyaCacheablePlugin()]
        )}

}
