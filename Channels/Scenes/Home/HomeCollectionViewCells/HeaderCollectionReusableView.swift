//
//  HeaderCollectionReusableView.swift
//  Channels
//
//  Created by Mai hassen on 4/11/20.
//  Copyright © 2020 Mai hassen. All rights reserved.
//

import UIKit

class HeaderCollectionReusableView: UICollectionReusableView {
    @IBOutlet weak private var headerSubtiltleLabel: UILabel!
    @IBOutlet weak private var headerTitleLabel: UILabel!
    @IBOutlet weak private var headerImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupView()
    }
    func configureHeaderCollection(image: String?,
                                   title: String?,
                                   subtitle: Int?,
                                   type: SectionType) {
        headerTitleLabel.text = title ?? ""
        headerImageView.sd_setImage(with: URL(string: image ?? ""), completed: nil)
        if type == .series {
            headerSubtiltleLabel.text = "\(subtitle ?? 0) Series"
        } else {
          headerSubtiltleLabel.text = "\(subtitle ?? 0) Eposides"
        }
        
    }
    func setupView() {
        headerTitleLabel.setupView(with: Asset.Colors.whiteColor.color,
                                   font: FontFamily.Gilroy.extraBold.font(size: 22))
        headerSubtiltleLabel.setupView(with: Asset.Colors.subTitleColor.color,
                                       font: FontFamily.Gilroy.light.font(size: 18))
        headerImageView.layer.modifyCornerRadius(radius: headerImageView.frame.height / 2)
    }
}
