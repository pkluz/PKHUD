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
        super.init(image: PKHUDAssets.progressImage)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func commonInit(image image: UIImage?) {
        super.commonInit(image: image)
        let progressImage = PKHUDAssets.progressImage
        imageView.image = progressImage
        imageView.alpha = 0.9
    }
    
    func startAnimation() {
        imageView.layer.addAnimation(PKHUDAnimation.rotation, forKey: "progressAnimation")
    }
    
    func stopAnimation() {
    }
}
