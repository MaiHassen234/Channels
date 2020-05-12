//
//  HomeParser.swift
//  Channels
//
//  Created by Mai hassen on 5/12/20.
//  Copyright © 2020 Mai hassen. All rights reserved.
//

import Foundation

class HomeParser: NSObject {
    
    func parseChannels(data: Data) -> [Channels]? {
        var channels: [Channels]? = [Channels]()
        do {
            let result = try JSONDecoder().decode(APIResponse<Home>.self, from: data)
            channels = result.data?.channels
        } catch {
        }
        return channels
    }
    
    func parseEposides(data: Data) -> [Media]? {
        var eposides: [Media]? = [Media]()
        do {
            let result = try JSONDecoder().decode(APIResponse<Home>.self, from: data)
            eposides = result.data?.media
        } catch {
        }
        return eposides
    }
    
    func parseCategories(data: Data) -> [Categories]? {
        var categories: [Categories]? = [Categories]()
        do {
            let result = try JSONDecoder().decode(APIResponse<Home>.self, from: data)
            categories = result.data?.categories
        } catch {
        }
        return categories
    }
}
