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
public class PKHUDProgressView: PKHUDSquareBaseView, PKHUDAnimating {
    
    public init(title: String? = nil, subtitle: String? = nil) {
        super.init(image: PKHUDAssets.progressActivityImage, title: title, subtitle: subtitle)
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
        
    func startAnimation() {
        imageView.layer.addAnimation(PKHUDAnimation.discreteRotation, forKey: "progressAnimation")
    }
    
    func stopAnimation() {
    }
}
