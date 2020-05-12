//
//  ChannelSeries.swift
//  Channels
//
//  Created by Mai hassen on 4/13/20.
//  Copyright © 2020 Mai hassen. All rights reserved.
//

import Foundation

struct ChannelSeries: Codable, Hashable {
    let title: String?
    let coverAsset: CoverAsset?

    enum CodingKeys: String, CodingKey {

        case title
        case coverAsset

    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        title = try values.decodeIfPresent(String.self, forKey: .title)
        coverAsset = try values.decodeIfPresent(CoverAsset.self, forKey: .coverAsset)
     
    }
}
