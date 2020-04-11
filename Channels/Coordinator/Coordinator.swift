//
//  Coordinator.swift
//  Channels
//
//  Created by Mai hassen on 3/23/20.
//  Copyright © 2020 Mai hassen. All rights reserved.
//

import UIKit

protocol CoordinatorDelegate: class {
    
    func didFinish(fromCoordinator coordinator: Coordinator)
    
}

class Coordinator: NSObject {
    
    private(set) var childCoordinators = [Coordinator]()
   
    weak var coordinatorDelegate: CoordinatorDelegate?
    
    func createModuleOfCoordinator() -> UIViewController? {
          return nil
      }
    func getRootViewController() -> UIViewController? {
         return nil
     }
     
  
    func start() {}
    
    func finish() {
        
        self.coordinatorDelegate?.didFinish(fromCoordinator: self)
        
    }
 
}

extension Coordinator {
    
    func addChildCoordinator(_ coordinator: Coordinator) {
        
        self.childCoordinators.append(coordinator)
        
    }
    
    func addChildCoordinators(_ coordinators: [Coordinator]) {
        
        self.childCoordinators.append(contentsOf: coordinators)
        
    }
    
    func removeChildCoordinator(_ coordinator: Coordinator) {
        
        if let coordinatorIndex = self.childCoordinators.firstIndex(of: coordinator) {
            
            self.childCoordinators.remove(at: coordinatorIndex)
            
        }
        
    }
    
    func removeAllChildCoordinators() {
        
        self.childCoordinators.removeAll()
        
    }
    
}

extension Coordinator: CoordinatorDelegate {
    
    func didFinish(fromCoordinator coordinator: Coordinator) {
        
        removeChildCoordinator(coordinator)
        
    }
    
}
