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
        // completion(.success(episodesResponse.data?.media))
        if NetworkManager.reachability {
            NetworkManager.shared.getDataFromApi(target: UserServices.eposides) { (result, _) in
                switch result {
                case .success(let data):
                    do {
                        let result = try JSONDecoder()
                            .decode(APIResponse<Home>.self,
                                    from: data)
                        let response = result.data
                        
                        completion(.success(response?.media))
                    } catch {
                        print(error)
                        completion(.failure(NetworkError.parseError))
                        
                    }
                    
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
        // completion(.success(episodesResponse.data?.media))
        if NetworkManager.reachability {
            NetworkManager.shared.getDataFromApi(target: UserServices.channels) { (result, _) in
                switch result {
                case .success(let data):
                    do {
                        let result = try JSONDecoder()
                            .decode(APIResponse<Home>.self,
                                    from: data)
                        let response = result.data
                        
                        completion(.success(response?.channels))
                    } catch {
                        print(error)
                        completion(.failure(NetworkError.parseError))
                        
                    }
                    
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
        // completion(.success(episodesResponse.data?.media))
        if NetworkManager.reachability {
            NetworkManager.shared.getDataFromApi(target: UserServices.categories) { (result, _) in
                switch result {
                case .success(let data):
                    do {
                        let result = try JSONDecoder()
                            .decode(APIResponse<Home>.self,
                                    from: data)
                        let response = result.data
                        
                        completion(.success(response?.categories))
                    } catch {
                        print(error)
                        completion(.failure(NetworkError.parseError))
                        
                    }
                    
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
    
    //
    //    if NetworkManager.reachability {
    //                   NetworkManager.shared.getDataFromApi(target:
    //                    UserServices.eposides { (result, _ )
    //                                                       in
    //                                                       switch result {
    //                                                       case .success(let data):
    //
    //                                                           do {
    //                                                               let result = try JSONDecoder()
    //                                                                   .decode(APIResponse<[SmeUpcommingSessionData]>.self,
    //                                                                           from: data)
    //                                                               let response = ResponseData(data: result.data,
    //                                                                                           pagination: result.pagination)
    //                                                               self.sessions = result.data
    //                                                               completion(.success(response))
    //                                                           } catch {
    //                                                               print(error)
    //                                                               completion(.failure(NetworkError.parseError))
    //
    //                                                           }
    //
    //                                                       case .failure(let error):
    //                                                           print(error)
    //                                                           completion(.failure(error))
    //
    //                                                       }
    //
    //                   }
    //               } else {
    //                   var error = NetworkError()
    //                   error.code = 6
    //                   completion(.failure(error))
    //               }
//    func getChannels(completion: @escaping (Result<[Channels]?, NetworkError>) -> Void) {
//        completion(.success(channelsResponse.data?.channels))
//    }
//
//    func getCategories(completion: @escaping(Result<[Categories]?, NetworkError>) -> Void) {
//        completion(.success(categoriesResponse.data?.categories))
//    }
}
