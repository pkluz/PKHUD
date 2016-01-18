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
public class PKHUDProgressView: PKHUDImageView, PKHUDAnimating {
    
    public init() {
        super.init(image: PKHUDAssets.progressImage, title: nil, subtitle: nil)
        imageView.alpha = 0.9
    }
    
    public init(title: String?, subtitle: String?) {
        super.init(image: PKHUDAssets.progressImage, title: title, subtitle: subtitle)
        imageView.alpha = 0.9
    }

    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
        
    func startAnimation() {
        imageView.layer.addAnimation(PKHUDAnimation.rotation, forKey: "progressAnimation")
    }
    
    func stopAnimation() {
    }
}
