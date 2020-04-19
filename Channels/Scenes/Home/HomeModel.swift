//
//  HomeModel.swift
//  Channels
//
//  Created by Mai hassen on 3/24/20.
//  Copyright © 2020 Mai hassen. All rights reserved.
//

import Foundation

class HomeModel: BaseModel, HomeModelProtocol {
    
    let episodesResponse = Bundle.main.decode(APIResponse<Home>.self, from: "EpisodeResponse.json")
    let channelsResponse = Bundle.main.decode(APIResponse<Home>.self, from: "ChannelsResponse.json")
    let categoriesResponse = Bundle.main.decode(APIResponse<Home>.self, from: "CategoryResponse.json")
        
    func getEpisodes(completion: @escaping(Result<[Media]?, NetworkError>) -> Void) {
        completion(.success(episodesResponse.data?.media))
    }
    
    func getChannels(completion: @escaping (Result<[Channels]?, NetworkError>) -> Void) {
        completion(.success(channelsResponse.data?.channels))
    }
    
    func getCategories(completion: @escaping(Result<[Categories]?, NetworkError>) -> Void) {
        completion(.success(categoriesResponse.data?.categories))
    }
}
