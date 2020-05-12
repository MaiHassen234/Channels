//
//  ChannelsCourseCollectionViewCell.swift
//  Channels
//
//  Created by Mai hassen on 4/11/20.
//  Copyright © 2020 Mai hassen. All rights reserved.
//

import UIKit

class ChannelsCourseCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak private  var courseImage: UIImageView!
    @IBOutlet weak private var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupView()
    }
   func configureCourseCell(with item: LatestMedia?) {
    courseImage.sd_setImage(with: URL(string: item?.coverAsset?.url ?? ""), completed: nil)
    titleLabel.text = item?.title ?? ""
         }
    
    func setupView() {
        courseImage.layer.modifyCornerRadius(radius: 20)
        titleLabel.setupView(with: Asset.Colors.whiteColor.color, font: FontFamily.Gilroy.extraBold.font(size: 17))
    }
}
