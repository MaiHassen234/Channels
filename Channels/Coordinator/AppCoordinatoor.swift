//
//  AppCoordinatoor.swift
//  Channels
//
//  Created by Mai hassen on 3/23/20.
//  Copyright © 2020 Mai hassen. All rights reserved.
//

import Foundation
import UIKit

class ApplicationCoordinator: Coordinator {
    
    var window: UIWindow?
    var rootCoordinator: Coordinator?
    var appRouter: AppRouter
    var navigationController: UINavigationController

    override init() {
        self.navigationController = UINavigationController()
        
        self.appRouter = AppRouter(navigationController: navigationController)
    }
    
    override func start() {

        if #available(iOS 13, *) {
            let scene = UIApplication.shared.connectedScenes.first
            guard let windowScene = (scene as? UIWindowScene) else { return }
            if window == nil {
            window = UIWindow(windowScene: windowScene)
            }
        } else {
            guard let appwindow = (UIApplication.shared.delegate?.window as? UIWindow) else { return }
            window = appwindow
        }
        self.startSplash()
        window?.rootViewController = appRouter.toPresentable()
        window?.makeKeyAndVisible()
        
    }

    func startSplash() {
        let splashCoordinator = SplashCoordinator(appRouter: appRouter)
        self.rootCoordinator = splashCoordinator
        self.rootCoordinator?.start()
        
    }
    
}
