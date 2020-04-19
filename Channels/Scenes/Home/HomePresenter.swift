//
//  HomePresenter.swift
//  Channels
//
//  Created by Mai hassen on 3/24/20.
//  Copyright © 2020 Mai hassen. All rights reserved.
//

import Foundation

class HomePresenter: BasePresenter, HomePresenterProtocol {
    var view: HomeViewProtocol
    var model: HomeModelProtocol
    weak var delegate: CoordinatorDelegate?
    init(view: HomeViewProtocol, model: HomeModelProtocol) {
        self.view = view
        self.model = model
    }
    func viewDidLoad() {
        self.fetchEpisodesData()
        self.fetchChannelsData()
        self.fetchCategoriesData()
        
    }
    
    func fetchEpisodesData() {
        model.getEpisodes { (result) in
            switch result {
            case .success(let data):
                
                self.view.addEpisodes(episodes: data)
                
            case .failure(let error):
                print(error.message as Any)
            }
        }
    }
    
    func fetchChannelsData() {
        model.getChannels { (result) in
            switch result {
            case .success(let data):
                
                self.view.addChannels(channels: data)
                
            case .failure(let error):
                print(error.message as Any)
            }
        }
    }
    
    func fetchCategoriesData() {
        model.getCategories { (result) in
            switch result {
            case .success(let data):
                self.view.addCategories(category: data)
            case .failure(let error):
                print(error.message as Any)
            }
        }
    }
}
