//
//  SetupViewsProtocol.swift
//  Channels
//
//  Created by Mai hassen on 4/13/20.
//  Copyright © 2020 Mai hassen. All rights reserved.
//

import Foundation
import UIKit

protocol SetupViewProtocol {
    func setupView(with text: String, textColor: UIColor, font: UIFont)
    func setupView(with textColor: UIColor, font: UIFont)
}

// optional methods
extension SetupViewProtocol {
    func setupView(with text: String, textColor: UIColor, font: UIFont) {}
    func setupView(with textColor: UIColor, font: UIFont) {}
}
// MARK: - Setup UIButton
extension UIButton: SetupViewProtocol {
    func setupView(with text: String, textColor: UIColor, font: UIFont) {
        setTitle(text, for: .normal)
        setTitleColor(textColor, for: .normal)
        titleLabel?.font = font
    }

    func setupView(with textColor: UIColor, font: UIFont) {
        setTitleColor(textColor, for: .normal)
        titleLabel?.font = font
    }

}

// MARK: - Setup UILabel
extension UILabel: SetupViewProtocol {
    func setupView(with text: String, textColor: UIColor, font: UIFont) {
        self.text = text
        self.textColor = textColor
        self.font = font
    }

    func setupView(with textColor: UIColor, font: UIFont) {
        self.textColor = textColor
        self.font = font
    }
}

extension UITextField: SetupViewProtocol {
    func setupView(with text: String, textColor: UIColor, font: UIFont) {
        self.text = text
        self.textColor = textColor
        self.font = font
    }
    
    func setupView(with textColor: UIColor, font: UIFont) {
        self.textColor = textColor
        self.font = font
    }
}

//extension UITextView: SetupViewProtocol {
//
//    func setupView(with placeHolder: String, textColor: UIColor, font: UIFont) {
//        self.placeholder = placeHolder
//        self.textColor = textColor
//        self.font = font
//    }
//
//    func setupView(with textColor: UIColor, font: UIFont) {
//        self.textColor = textColor
//        self.font = font
//    }
//
//}
