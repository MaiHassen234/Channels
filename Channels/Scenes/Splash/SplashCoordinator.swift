//
//  SplashCoordinator.swift
//  Channels
//
//  Created by Mai hassen on 3/30/20.
//  Copyright © 2020 Mai hassen. All rights reserved.
//

import Foundation
import  UIKit
class SplashCoordinator: Coordinator {
    
    var appRouter: AppRouter
    var splashScreenViewController: SplashViewController?
    var homeCoordinator: HomeCoordinator?
    
    init(appRouter: AppRouter) {
        
        self.appRouter = appRouter
        
    }
    
    override func start() {
        
        appRouter.navigationController.navigationBar.isHidden = true
        guard let viewController = self.createModuleOfCoordinator() else { return }
        self.appRouter.push(viewController, animated: true, completion: nil)
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
            self.startHome()
        }
        
    }
    
    override func createModuleOfCoordinator() -> UIViewController? {
        
        splashScreenViewController = SplashViewController()
        
        return  splashScreenViewController
        
    }
    
    override func finish() {
        
        print("SPLASH: FINISHED")
        if self.appRouter.navigationController.topViewController == self.splashScreenViewController {
            self.appRouter
                .pop(animated: true)
        }
        
    }
    
}
extension SplashCoordinator {
    
    func startHome() {
        let coordinator = HomeCoordinator(appRouter: appRouter)
        self.homeCoordinator = coordinator
        if let homeCoordinator = self.homeCoordinator {
            addChildCoordinator(homeCoordinator)
        }
        self.homeCoordinator?.start()
    }
}
