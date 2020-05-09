//
//  BaseViewController.swift
//  Monshaat_SMEOwner_IOS
//
//  Created by Mai on 11/24/19.
//  Copyright © 2019 Ibtikar. All rights reserved.
//

import Foundation
import UIKit
import ToastSwiftFramework

class BaseViewController<Presenter: BasePresenterProtocol>: UIViewController, BaseViewProtocol {

    
    
    // MARK: - Presenter Setup
    var presenter: Presenter!
    private var container: UIView = UIView()
    private var loadingView: UIView = UIView()
    private var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    
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
    
    
    
    func showLoader(allowNavigation: Bool) {
        container.frame = CGRect(x: 0,
                                 y: 0,
                                 width: UIScreen.main.bounds.width,
                                 height: UIScreen.main.bounds.height)
        container.center = CGPoint(x: UIScreen.main.bounds.width / 2,
                                   y: UIScreen.main.bounds.height / 2)
        container.backgroundColor = Asset.Colors.channelColor.color.withAlphaComponent(0.5)
        
        loadingView.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
        loadingView.center = CGPoint(x: UIScreen.main.bounds.width / 2,
                                     y: UIScreen.main.bounds.height / 2)
        loadingView.backgroundColor = Asset.Colors.backgroundColor.color
        loadingView.clipsToBounds = true
        loadingView.layer.cornerRadius = 10
        
        activityIndicator.frame = CGRect(x: 0.0, y: 0.0, width: 40.0, height: 40.0);
        activityIndicator.style = UIActivityIndicatorView.Style.whiteLarge
        activityIndicator.color = Asset.Colors.channelColor.color
        activityIndicator.center = CGPoint(x: loadingView.frame.size.width / 2,
                                           y: loadingView.frame.size.height / 2)
        activityIndicator.startAnimating()
        
        container.addSubview(loadingView)
        self.view.addSubview(container)
        loadingView.addSubview(activityIndicator)
        
    }
    

    func hideLoader() {
        activityIndicator.stopAnimating()
        container.removeFromSuperview()
    }
    
    func showErrorMassege(errorMessage: String) {
        UIApplication.shared.windows.last?.makeToast(errorMessage)
    }
}
