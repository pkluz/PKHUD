//
//  PKHUDCustomProgressView.swift
//  PKHUD
//
//  Created by Mark Koh on 1/14/16.
//  Copyright © 2016 NSExceptional. All rights reserved.
//

import UIKit
import QuartzCore

/// PKHUDCustomProgressView provides a content view that rotates the supplies image automatically.
public class PKHUDCustomProgressView: PKHUDImageView, PKHUDAnimating {
    
    public override init(image: UIImage?) {
        super.init(image: image)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func commonInit(image image: UIImage?) {
        super.commonInit(image: image)
        let progressImage = image
        imageView.image = progressImage
        imageView.alpha = 0.9
    }
    
    func startAnimation() {
        imageView.layer.addAnimation(PKHUDAnimation.continuousRotation, forKey: "progressAnimation")
    }
    
    func stopAnimation() {
    }
}
