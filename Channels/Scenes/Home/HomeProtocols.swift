//
//  HomeProtocols.swift
//  Channels
//
//  Created by Mai hassen on 3/24/20.
//  Copyright © 2020 Mai hassen. All rights reserved.
//

import Foundation
import UIKit

protocol HomeViewProtocol: BaseViewProtocol {
    func addEpisodes(episodes: [Media]?)
    func addChannels(channels: [Channels]?)
    func addCategories(category: [Categories]?)
}
protocol HomeModelProtocol: BaseModelProtocol {
    func getEpisodes(completion: @escaping(Result<[Media]?, NetworkError>) -> Void)
    func getChannels(completion: @escaping (Result<[Channels]?, NetworkError>) -> Void)
    func getCategories(completion: @escaping(Result<[Categories]?, NetworkError>) -> Void)
}
protocol HomePresenterProtocol: BasePresenterProtocol {
    func fetchEpisodesData()
    func fetchChannelsData()
    func fetchCategoriesData()
}
