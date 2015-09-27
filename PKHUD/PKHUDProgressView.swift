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
    
    let progressAnimation: CAKeyframeAnimation = {
        let animation = CAKeyframeAnimation(keyPath: "transform.rotation.z")
        animation.values = [
            NSNumber(float: 0.0),
            NSNumber(float: 1.0 * Float(M_PI) / 6.0),
            NSNumber(float: 2.0 * Float(M_PI) / 6.0),
            NSNumber(float: 3.0 * Float(M_PI) / 6.0),
            NSNumber(float: 4.0 * Float(M_PI) / 6.0),
            NSNumber(float: 5.0 * Float(M_PI) / 6.0),
            NSNumber(float: 6.0 * Float(M_PI) / 6.0),
            NSNumber(float: 7.0 * Float(M_PI) / 6.0),
            NSNumber(float: 8.0 * Float(M_PI) / 6.0),
            NSNumber(float: 9.0 * Float(M_PI) / 6.0),
            NSNumber(float: 10.0 * Float(M_PI) / 6.0),
            NSNumber(float: 11.0 * Float(M_PI) / 6.0),
            NSNumber(float: 2.0 * Float(M_PI))
        ]
        animation.keyTimes = [
            NSNumber(float: 0.0),
            NSNumber(float: 1.0 / 12.0),
            NSNumber(float: 2.0 / 12.0),
            NSNumber(float: 3.0 / 12.0),
            NSNumber(float: 4.0 / 12.0),
            NSNumber(float: 5.0 / 12.0),
            NSNumber(float: 0.5),
            NSNumber(float: 7.0 / 12.0),
            NSNumber(float: 8.0 / 12.0),
            NSNumber(float: 9.0 / 12.0),
            NSNumber(float: 10.0 / 12.0),
            NSNumber(float: 11.0 / 12.0),
            NSNumber(float: 1.0)
        ]
        animation.duration = 1.2
        animation.calculationMode = "discrete"
        animation.repeatCount = Float(INT_MAX)
        return animation
        }()
    
    func startAnimation() {
        imageView.layer.addAnimation(progressAnimation, forKey: "progressAnimation")
    }
    
    func stopAnimation() {
    }
}
