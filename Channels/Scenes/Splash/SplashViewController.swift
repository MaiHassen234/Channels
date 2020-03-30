//
//  SplashViewController.swift
//  Channels
//
//  Created by Mai hassen on 3/30/20.
//  Copyright © 2020 Mai hassen. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {
    @IBOutlet private weak var channelsImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        startAnimation()
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
        
}

// MARK: - Private Methods

extension SplashViewController {

    private func startAnimation() {
          let screenWidth = UIScreen.main.bounds.width
          let screenHeight = UIScreen.main.bounds.height
          
          let leftSplashImage = UIImageView(frame: CGRect(x: 0,
                                                          y: 0,
                                                          width: 154,
                                                          height: 128))
          
          leftSplashImage.image = UIImage(named: "LeftSplash")
          
          self.view.addSubview(leftSplashImage)
          
          let leftSplashImageXOffset = screenWidth / 2 - leftSplashImage.frame.width + 20
          
          let leftSplashImageYOffset = screenHeight / 2 - leftSplashImage.frame.height
                  
          let rightSplashImage = UIImageView(frame: CGRect(x: screenWidth,
                                                           y: screenHeight,
                                                           width: 154,
                                                           height: 128))

          rightSplashImage.image = UIImage(named: "RightSplash")
          
          self.view.addSubview(rightSplashImage)
          
          let rightSplashImageXOffset = -screenWidth / 2 - rightSplashImage.frame.width / 2 + 20
           
          let rightSplashImageYOffset = -screenHeight / 2 - rightSplashImage.frame.height
        
          let animator = UIViewPropertyAnimator(duration: 4, curve: .linear) {
              leftSplashImage.frame = leftSplashImage.frame.offsetBy(dx: leftSplashImageXOffset,
                                                                     dy: leftSplashImageYOffset)
              rightSplashImage.frame = rightSplashImage.frame.offsetBy(dx: rightSplashImageXOffset,
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
