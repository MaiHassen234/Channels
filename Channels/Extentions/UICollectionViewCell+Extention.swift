//
//  UICollectionViewCell+Extention.swift
//  Channels
//
//  Created by Mai hassen on 4/11/20.
//  Copyright © 2020 Mai hassen. All rights reserved.
//

import Foundation
import UIKit

extension UICollectionReusableView {
    static var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }

    static var identifier: String {
        return String(describing: self)
    }
}
