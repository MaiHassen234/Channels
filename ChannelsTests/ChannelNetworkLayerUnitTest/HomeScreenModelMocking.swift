//
//  HomeScreenModelMocking.swift
//  ChannelsTests
//
//  Created by Mai hassen on 5/12/20.
//  Copyright © 2020 Mai hassen. All rights reserved.
//

import Foundation
import XCTest
@testable import Channels

class HomeScreenModelMocking: HomeModelProtocol {
    var channels: [Channels]? = [Channels]()
    var media: [Media]? = [Media]()
    var categories: [Categories]? = [Categories]()
    var type: Type?
    
    func getChannels(completion: @escaping (Result<[Channels]?, NetworkError>) -> Void) {
       let channelsResponse = Bundle.main.decode(APIResponse<Home>.self,
                                                 from: "ChannelsResponse.json")
        self.channels = channelsResponse.data?.channels
        completion(.success(channelsResponse.data?.channels))
          
    }
    
    func getEpisodes(completion: @escaping (Result<[Media]?, NetworkError>) -> Void) {
        let episodesResponse = Bundle.main.decode(APIResponse<Home>.self,
                                                  from: "EpisodeResponse.json")
        self.media = episodesResponse.data?.media
        completion(.success(episodesResponse.data?.media))
    }
    
    func getCategories(completion: @escaping (Result<[Categories]?, NetworkError>) -> Void) {
          let categoriesResponse = Bundle.main.decode(APIResponse<Home>.self,
                                                      from: "CategoryResponse.json")
        self.categories = categoriesResponse.data?.categories
        completion(.success(categoriesResponse.data?.categories))
    }
    
    func getEpisode() -> String? {
        return media?[0].title
    }
}

enum Type {
    case mock
    case stub
}
