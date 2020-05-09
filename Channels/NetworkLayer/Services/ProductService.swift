//
//  ProductService.swift
//  Monshaat_SMEOwner_IOS
//
//  Created by Mai on 11/24/19.
//  Copyright © 2019 Ibtikar. All rights reserved.
//
//swiftlint:disable  force_unwrapping
import Foundation
import Moya

enum  UserServices {
    case eposides
    case channels
    case categories
}
//https://pastebin.com/raw/A0CgArX3
//https://pastebin.com/raw/Xt12uVhM
//https://pastebin.com/raw/z5AExTtw
extension UserServices: TargetType {
    var path: String {
      switch self {
      case .eposides:
        return "/z5AExTtw"
        
      case .channels:
        return "/Xt12uVhM"
        
      case .categories:
        return "/A0CgArX3"
    }
    }
    
    var baseURL: URL {
        return URL(string: NetworkDefaults.defaults.baseUrl)!
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
           return .requestPlain
    }
    
    var headers: [String: String]? {
              return nil
    }
        
}
