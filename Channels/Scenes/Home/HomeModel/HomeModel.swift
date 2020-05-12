//
//  HomeModel.swift
//  Channels
//
//  Created by Mai hassen on 3/24/20.
//  Copyright © 2020 Mai hassen. All rights reserved.
//

import Foundation

class HomeModel: BaseModel, HomeModelProtocol {
    let homeParser: HomeParser = HomeParser()
    //    let episodesResponse = Bundle.main.decode(APIResponse<Home>.self, from: "EpisodeResponse.json")
    //    let channelsResponse = Bundle.main.decode(APIResponse<Home>.self, from: "ChannelsResponse.json")
    //    let categoriesResponse = Bundle.main.decode(APIResponse<Home>.self, from: "CategoryResponse.json")
    
    func getEpisodes(completion: @escaping(Result<[Media]?, NetworkError>) -> Void) {
        
        if NetworkManager.reachability {
            NetworkManager.shared.getDataFromApi(target: UserServices.eposides) { (result, _) in
                switch result {
                case .success(let data):
                        let media = self.homeParser.parseEposides(data: data)
                        completion(.success(media))

                case .failure(let error):
                    print(error)
                    completion(.failure(NetworkError.parseError))
                    
                }
                
            }
        } else {
            var error = NetworkError()
            error.code = 6
            completion(.failure(error))
        }
        
    }
    
    func getChannels(completion: @escaping(Result<[Channels]?, NetworkError>) -> Void) {
        
        if NetworkManager.reachability {
            NetworkManager.shared.getDataFromApi(target: UserServices.channels) { (result, _) in
                switch result {
                case .success(let data):
                    let channels = self.homeParser.parseChannels(data: data)
                    completion(.success(channels))
                    
                case .failure(let error):
                    print(error)
                    completion(.failure(NetworkError.parseError))
                    
                }
                
            }
        } else {
            var error = NetworkError()
            error.code = 6
            completion(.failure(error))
        }
        
    }
    
    func getCategories(completion: @escaping(Result<[Categories]?, NetworkError>) -> Void) {
        
        if NetworkManager.reachability {
            NetworkManager.shared.getDataFromApi(target: UserServices.categories) { (result, _) in
                switch result {
                case .success(let data):
                    let categories = self.homeParser.parseCategories(data: data)
                    completion(.success(categories))

                case .failure(let error):
                    print(error)
                    completion(.failure(NetworkError.parseError))
                    
                }
                
            }
        } else {
            var error = NetworkError()
            error.code = 6
            completion(.failure(error))
        }
        
    }
    
}
