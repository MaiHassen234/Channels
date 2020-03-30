//
//  Router.swift
//  Channels
//
//  Created by Mai hassen on 3/23/20.
//  Copyright © 2020 Mai hassen. All rights reserved.
//

import Foundation
import UIKit

protocol Router {
    // MARK: - NavigationController Transitions
    var navigationController: UINavigationController { get }
    func push(_ module: Showable, animated: Bool, completion: (() -> Void)?)
    func pop(animated: Bool)
    
    // MARK: - ViewController Transitions
    var rootViewController: UIViewController? { get }
    func present(_ module: Showable, animated: Bool)
    func dismissModule(animated: Bool, completion: (() -> Void)?)
}

protocol Showable {
    func toShowable() -> UIViewController
}
