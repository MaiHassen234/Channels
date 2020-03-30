//
//  BaseViewController.swift
//  Monshaat_SMEOwner_IOS
//
//  Created by Mai on 11/24/19.
//  Copyright © 2019 Ibtikar. All rights reserved.
//

import Foundation
import UIKit

class BaseViewController<Presenter: BasePresenterProtocol>: UIViewController, BaseViewProtocol {

    // MARK: - Presenter Setup
    var presenter: Presenter!

    override func viewDidLoad() {
        super.viewDidLoad()
         self.hidesBottomBarWhenPushed = true
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    public func setPresenter (presenter: Presenter) {
        self.presenter = presenter
    }

    // MARK: - ViewMessageable Protocol

}
