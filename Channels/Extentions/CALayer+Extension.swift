//
//  CALayer+Extension.swift
//  Channels
//
//  Created by Mai hassen on 4/13/20.
//  Copyright © 2020 Mai hassen. All rights reserved.
//

import Foundation
import UIKit

extension CALayer {
    // MARK: - Setup View Redius
    func modifyCornerRadius(radius: CGFloat) {
        self.cornerRadius = radius
        self.masksToBounds = true
    }
    
    func setCornerRadius(radius: CGFloat, maskToBounds: Bool) {
        self.cornerRadius = radius
        self.masksToBounds = maskToBounds
    }
    
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds,
                                byRoundingCorners: corners,
                                cornerRadii: CGSize(width: radius,
                                                    height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.mask = mask
    }
    
    func setShadow(opacity: Float, radius: CGFloat, shadowColor: CGColor) {
        self.shadowColor = shadowColor
        self.shadowOpacity = opacity
        self.shadowOffset = CGSize.zero
        self.shadowRadius = radius
        self.masksToBounds = false
    }
    
    func setBorder(borderColor: CGColor, width: CGFloat ) {
        self.borderColor = borderColor
        self.borderWidth = width
    }
    func roundTopCorner(radius: CGFloat) {
        self.cornerRadius = radius
        self.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        self.masksToBounds = true
    }
}
