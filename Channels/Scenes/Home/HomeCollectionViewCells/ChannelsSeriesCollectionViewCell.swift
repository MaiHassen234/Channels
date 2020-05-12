//
//  ChannelsSeriesCollectionViewCell.swift
//  Channels
//
//  Created by Mai hassen on 4/11/20.
//  Copyright © 2020 Mai hassen. All rights reserved.
//

import UIKit

class ChannelsSeriesCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak private var seriesImg: UIImageView!
    
    @IBOutlet weak private var seriesTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupView()
    }
       func configureSeriesCell(with item: LatestMedia?) {
        seriesImg.sd_setImage(with: URL(string: item?.coverAsset?.url ?? ""), completed: nil)
        seriesTitle.text = item?.title ?? ""
        }
    func setupView() {
        seriesImg.layer.modifyCornerRadius(radius: 20)
        seriesTitle.setupView(with: Asset.Colors.whiteColor.color, font: FontFamily.Gilroy.extraBold.font(size: 17))
    }
}
