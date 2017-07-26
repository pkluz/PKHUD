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

    public init(frame: CGRect? = nil, image: UIImage = PKHUDAssets.progressActivityImage, title: String? = nil, subtitle: String? = nil) {
        if let f = frame {
            super.init(frame: f, image: image, title: title, subtitle: subtitle)
        } else {
            super.init(image: image, title: title, subtitle: subtitle)
        }
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
