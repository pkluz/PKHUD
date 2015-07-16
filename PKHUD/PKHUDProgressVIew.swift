//
//  PKHUDProgressVIew.swift
//  PKHUD
//
//  Created by Philip Kluz on 6/12/15.
//  Copyright © 2015 NSExceptional. All rights reserved.
//

import UIKit
import QuartzCore

/// PKHUDProgressView provides a square (indeterminate) progress view.
public final class PKHUDProgressView: PKHUDImageView {
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
        imageView.layer.addAnimation({
            let animation = CABasicAnimation(keyPath: "transform.rotation.z")
            animation.toValue = NSNumber(float: 2.0 * Float(M_PI))
            animation.duration = 1.2
            animation.cumulative = true
            animation.repeatCount = Float(INT_MAX)
            return animation
        }(), forKey: "transform.rotation.z")
        imageView.alpha = 0.9
    }
}
