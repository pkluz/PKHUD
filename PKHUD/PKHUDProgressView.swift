//
//  PKHUDProgressVIew.swift
//  PKHUD
//
//  Created by Philip Kluz on 6/12/15.
//  Copyright (c) 2015 NSExceptional. All rights reserved.
//

import UIKit
import QuartzCore

/// PKHUDProgressView provides an indeterminate progress view.
public class PKHUDProgressView: PKHUDSquareBaseView, PKHUDAnimating {
    
    public init() {
        super.init(image: PKHUDAssets.progressActivityImage, title: nil, subtitle: nil)
        imageView.alpha = 0.9
    }
    
    public init(title: String?, subtitle: String?) {
        super.init(image: PKHUDAssets.progressActivityImage, title: title, subtitle: subtitle)
        imageView.alpha = 0.9
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        imageView.alpha = 0.9
    }
        
    func startAnimation() {
        imageView.layer.addAnimation(PKHUDAnimation.discreteRotation, forKey: "progressAnimation")
    }
    
    func stopAnimation() {
    }
}
