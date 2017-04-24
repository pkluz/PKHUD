//
//  PKHUDSquareBaseView.swift
//  PKHUD
//
//  Created by Philip Kluz on 6/12/15.
//  Copyright (c) 2016 NSExceptional. All rights reserved.
//  Licensed under the MIT license.
//

import UIKit

/// PKHUDSquareBaseView provides a square view, which you can subclass and add additional views to.
open class PKHUDSquareBaseView: UIView {
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    public init(image: UIImage? = nil, title: String? = nil, subtitle: String? = nil) {
        super.init(frame: HUDConfig.squareBaseViewFrame)
        self.imageView.image = image
        titleLabel.text = title
        subtitleLabel.text = subtitle

        addSubview(imageView)
        addSubview(titleLabel)
        addSubview(subtitleLabel)
    }

    open let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.alpha = 0.85
        imageView.clipsToBounds = true
        imageView.contentMode = .center
        return imageView
    }()

    open let titleLabel: UILabel = {
        return HUDConfig.titleLabel.label()
    }()

    open let subtitleLabel: UILabel = {
        let label = UILabel()
        return HUDConfig.subtitleLabel.label()
    }()

    open override func layoutSubviews() {
        super.layoutSubviews()
        titleLabel.frame = HUDConfig.titleLabelFrame
        imageView.frame = HUDConfig.imageViewFrame
        subtitleLabel.frame = HUDConfig.subtitleLabelFrame
    }
}
