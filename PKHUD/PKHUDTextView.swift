//
//  PKHUDTextView.swift
//  PKHUD
//
//  Created by Philip Kluz on 6/12/15.
//  Copyright (c) 2016 NSExceptional. All rights reserved.
//  Licensed under the MIT license.
//

import UIKit

/// PKHUDTextView provides a wide, three line text view, which you can use to display information.
open class PKHUDTextView: PKHUDWideBaseView {

    public init(text: String?) {
        super.init()
        commonInit(text)
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit("")
    }

    func commonInit(_ text: String?) {
        titleLabel.text = text
        addSubview(titleLabel)
    }

    open override func layoutSubviews() {
        super.layoutSubviews()

        let padding: CGFloat = 10.0
        titleLabel.frame = bounds.insetBy(dx: padding, dy: padding)
    }

    open let titleLabel: UILabel = {
        return HUDConfig.textViewTitleLabel.label()
    }()

}
