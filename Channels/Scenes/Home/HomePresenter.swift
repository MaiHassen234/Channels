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
}
