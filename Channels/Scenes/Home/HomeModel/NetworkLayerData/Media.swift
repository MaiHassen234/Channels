//
//  Media.swift
//  Channels
//
//  Created by Mai hassen on 4/11/20.
//  Copyright © 2020 Mai hassen. All rights reserved.
//

import Foundation

public struct Media: Codable, Hashable {
  let type: String?
  let title: String?
  let coverAsset: CoverAsset?
  let channel: Channel?
    
  enum CodingKeys: String, CodingKey {
    case type
    case title
    case coverAsset
    case channel
  }
  public init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    type = try values.decodeIfPresent(String.self, forKey: .type)
    title = try values.decodeIfPresent(String.self, forKey: .title)
    coverAsset = try values.decodeIfPresent(CoverAsset.self, forKey: .coverAsset)
    channel = try values.decodeIfPresent(Channel.self, forKey: .channel)
  }
}

struct Channel: Codable, Hashable {
    let title: String?
    
    enum CodingKeys: String, CodingKey {
        case title
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        title = try values.decodeIfPresent(String.self, forKey: .title)
    }
}
