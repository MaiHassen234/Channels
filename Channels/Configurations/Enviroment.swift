//
//  Enviroment.swift
//  Monshaat_SMEOwner_IOS
//
//  Created by Mai on 11/20/19.
//  Copyright © 2019 Ibtikar. All rights reserved.
//

import Foundation

public enum Environment {
    // MARK: - Keys

    enum PlistKeys {
        static let rootURL = "BASE_URL"
    }

    // MARK: - Plist
    private static let infoDictionary: [String: Any] = {
        guard let dict = Bundle.main.infoDictionary else {
            fatalError("Plist file not found")
        }
        return dict
    }()
    // MARK: - Plist values
    static let rootURL: String = {
        guard let rootURLstring = Environment.infoDictionary[PlistKeys.rootURL] as? String else {
            fatalError("Root URL not set in plist for this environment")
        }
        let baseUrl = "https://\(rootURLstring)"
        guard let url = URL(string: baseUrl ) else {
            fatalError("Root URL is invalid")
        }
        print("url version", url.absoluteString )
        return url.absoluteString
    }()
   
}
