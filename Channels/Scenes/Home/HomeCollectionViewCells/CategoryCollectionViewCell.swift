//
//  CategoryCollectionViewCell.swift
//  Channels
//
//  Created by Mai hassen on 4/11/20.
//  Copyright © 2020 Mai hassen. All rights reserved.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak private var categoryTitleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupView()
    }
    func configureCategoryCell(with item: Categories?) {
        categoryTitleLabel.text = item?.name ?? ""
    }
    func setupView() {
        categoryTitleLabel.layer.modifyCornerRadius(radius: categoryTitleLabel.frame.height / 2 )
        categoryTitleLabel.setupView(with: Asset.Colors.whiteColor.color,
                                     font: FontFamily.Gilroy.extraBold.font(size: 17))
    }
}
