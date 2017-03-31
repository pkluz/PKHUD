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
    
    public init(text: String?, font: UIFont? = UIFont.boldSystemFont(ofSize: 17.0)) {
        super.init()
        commonInit(text, font: font)
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit("", font: nil)
    }

    func commonInit(_ text: String?, font: UIFont?) {
        titleLabel.text = text
        titleLabel.font = font
        addSubview(titleLabel)
    }

    open override func layoutSubviews() {
        super.layoutSubviews()

        let padding: CGFloat = 10.0
        titleLabel.frame = bounds.insetBy(dx: padding, dy: padding)
    }

    open let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = UIColor.black.withAlphaComponent(0.85)
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 3
        return label
    }()
}
