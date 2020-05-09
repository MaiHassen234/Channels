//
//  UIFont+Extension.swift
//  Channels
//
//  Created by Mai hassen on 4/20/20.
//  Copyright © 2020 Mai hassen. All rights reserved.
//

import Foundation
import UIKit

extension UIFont {

    static func showAllFonts() {
        UIFont.familyNames.forEach { family in
            print(family)
            print("\t\(UIFont.fontNames(forFamilyName: family).joined(separator: "\n\t"))")
        }
    }
}
