//
//  PKHUDProgressVIew.swift
//  PKHUD
//
//  Created by Philip Kluz on 6/12/15.
//  Copyright (c) 2016 NSExceptional. All rights reserved.
//  Licensed under the MIT license.
//

import UIKit
import QuartzCore

/// PKHUDProgressView provides an indeterminate progress view.
open class PKHUDProgressView: PKHUDSquareBaseView, PKHUDAnimating {

    public init(title: String? = nil,
                titleFont: UIFont? = UIFont.boldSystemFont(ofSize: 17.0),
                subtitle: String? = nil,
                subtitleFont: UIFont? = UIFont.boldSystemFont(ofSize: 14.0)) {
        
        super.init(image: PKHUDAssets.progressActivityImage,
                   title: title,
                   titleFont: titleFont,
                   subtitle: subtitle,
                   subtitleFont: subtitleFont)
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    public func startAnimation() {
        imageView.layer.add(PKHUDAnimation.discreteRotation, forKey: "progressAnimation")
    }

    public func stopAnimation() {
    }
}
