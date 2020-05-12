//
//  HeaderTitleCollectionReusableView.swift
//  Channels
//
//  Created by Mai hassen on 4/11/20.
//  Copyright © 2020 Mai hassen. All rights reserved.
//

import UIKit

class HeaderTitleCollectionReusableView: UICollectionReusableView {

    @IBOutlet weak private var headerTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureHeaderTitleView(type: SectionType) {
        switch type {
        case .episode:
            headerTitle.text = L10n.Home.newEposideLabel
        case .categories:
            headerTitle.text = L10n.Home.browseByCategoriesLabel
        default:
            print("default")
        }
        headerTitle.setupView(with: Asset.Colors.subTitleColor.color,
                              font: FontFamily.Gilroy.extraBold.font(size: 22))
    }
    
}
