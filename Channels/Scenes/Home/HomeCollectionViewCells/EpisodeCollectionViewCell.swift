//
//  EpisodeCollectionViewCell.swift
//  Channels
//
//  Created by Mai hassen on 4/11/20.
//  Copyright © 2020 Mai hassen. All rights reserved.
//

import UIKit
import SDWebImage
class EpisodeCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak private var eposideImageView: UIImageView!
    @IBOutlet weak private var eposideDescriptionLabel: UILabel!
    @IBOutlet weak private var eposideTitleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupView()
    }
   func configureEposideCell(with item: Media?) {
    eposideTitleLabel.text = item?.title ?? ""
    eposideDescriptionLabel.text = item?.channel?.title ?? ""
    eposideImageView.sd_setImage(with: URL(string: item?.coverAsset?.url ?? ""), completed: nil)
   }
    func setupView() {
        eposideImageView.image = Asset.Images.test.image
        eposideImageView.layer.modifyCornerRadius(radius: 20)
        eposideTitleLabel.setupView(with: Asset.Colors.whiteColor.color,
                                    font: FontFamily.Gilroy.extraBold.font(size: 17))
        eposideDescriptionLabel.setupView(with: Asset.Colors.subTitleColor.color,
                                          font: FontFamily.Gilroy.extraBold.font(size: 14))
    }
    
}
