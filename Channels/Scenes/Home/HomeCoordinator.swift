//
//  HomeCoordinator.swift
//  Channels
//
//  Created by Mai hassen on 3/23/20.
//  Copyright © 2020 Mai hassen. All rights reserved.
//

import UIKit

class HomeCoordinator: Coordinator {
    
    var appRouter: AppRouter
    
 
    
    init(appRouter: AppRouter) {
        
        self.appRouter = appRouter
        
    }
    
    override func start() {
        
        appRouter.navigationController.navigationBar.isHidden = true
        guard let viewController = self.createModuleOfCoordinator() else { return }
        self.appRouter.push(viewController, animated: true, completion: nil)
        
    }
    
    override func createModuleOfCoordinator() -> UIViewController? {

        let view = HomeViewController()
         let model = HomeModel()
         let presenter = HomePresenter(view: view, model: model)
         view.setPresenter(presenter: presenter)
         return view
        
    }
    
}


