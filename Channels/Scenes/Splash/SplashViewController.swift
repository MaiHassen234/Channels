//
//  SplashViewController.swift
//  Channels
//
//  Created by Mai hassen on 3/30/20.
//  Copyright © 2020 Mai hassen. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet private weak var channelsImageView: UIImageView!
    // MARK: - Lazy Variables
    lazy var leftSplashImage: UIImageView = {

        let imageView = UIImageView(image: Asset.Images.leftSplash.image)
        imageView.frame = CGRect(x: 0, y: 0, width: 154, height: 128)
        imageView.contentMode = .scaleAspectFit
        return imageView

    }()
    
    lazy var rightSplashImage: UIImageView = {

        let imageView = UIImageView(image: Asset.Images.rightSplash.image)
        imageView.frame = CGRect(x: Utilities.screenWidth, y: Utilities.screenHeight,
                                 width: 154, height: 128)
        imageView.contentMode = .scaleAspectFit
        return imageView

    }()
  // MARK: - ViewController Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        startAnimation()
        
    }
    
}

// MARK: - Private Methods

extension SplashViewController {
    private func setupView() {
        
        self.view.addSubview(leftSplashImage)
        
        self.view.addSubview(rightSplashImage)
        
    }
        
    private func startAnimation() {
        
        let leftSplashImageXOffset = Utilities.screenWidth / 2 - leftSplashImage.frame.width + 20
        let leftSplashImageYOffset = Utilities.screenHeight / 2 - leftSplashImage.frame.height
        let rightSplashImageXOffset = -Utilities.screenWidth / 2 - rightSplashImage.frame.width / 2 + 20
        let rightSplashImageYOffset = -Utilities.screenHeight / 2 - rightSplashImage.frame.height
                
        let animator = UIViewPropertyAnimator(duration: 4, curve: .linear) {
            self.leftSplashImage.frame = self.leftSplashImage.frame.offsetBy(dx: leftSplashImageXOffset,
                                                                             dy: leftSplashImageYOffset)
            self.rightSplashImage.frame = self.rightSplashImage.frame.offsetBy(dx: rightSplashImageXOffset,
                                                                               dy: rightSplashImageYOffset)
        }
        
        animator.startAnimation()
        
        UIView.animateKeyframes(withDuration: 4.0, delay: 0.0, options: [], animations: {
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 1.0, animations: {
                
                self.channelsImageView.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
                self.channelsImageView.alpha = 0
            })
            UIView.addKeyframe(withRelativeStartTime: 3.0, relativeDuration: 1, animations: {
                
                self.channelsImageView.transform = CGAffineTransform(scaleX: 1, y: 1)
                self.channelsImageView.alpha = 1
            })
        })
    }
}
