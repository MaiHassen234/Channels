//
//  NetworkService.swift
//  Monshaat_SMEOwner_IOS
//
//  Created by Mai on 11/24/19.
//  Copyright © 2019 Ibtikar. All rights reserved.
//

import Foundation
import  Moya

extension NetworkManager {
    func getDataFromApi(target: TargetType, completion: @escaping (
        _ result: Swift.Result<Data, NetworkError>,
        _ statusCode: StatusCode?
        ) -> Void) {
        
        provider.request(MultiTarget(target)) { (result) in
            switch result {
            case .success(let response):
                if (200...299 ~= response.statusCode) {
                    completion(.success(response.data), response.statusCode)
                } else {
                    // 300-399 ,400-499
                    do {
                        var businessError = try JSONDecoder().decode(NetworkError.self, from: response.data)
                        print(response.data)
                        businessError.type = .business
                        completion(.failure(businessError), response.statusCode)
                    } catch {
                        completion(.failure(NetworkError.parseError), response.statusCode)
                    }
                }
                
            case .failure(let error):
                let customError = NetworkError(error: error)
                completion(.failure(customError), nil)
            }
        }
    }
}
