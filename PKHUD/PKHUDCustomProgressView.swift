//
//  PKHUDCustomProgressView.swift
//  PKHUD
//
//  Created by Mark Koh on 1/14/16.
//  Copyright © 2016 Mark Koh, NSExceptional. All rights reserved.
//  Licensed under the MIT license.
//

import UIKit
import QuartzCore

/// PKHUDCustomProgressView provides a content view that rotates the supplies image automatically.
public class PKHUDCustomProgressView: PKHUDSquareBaseView, PKHUDAnimating {
    
    public init(image: UIImage?) {
        super.init(image: image, title: nil, subtitle: nil)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func startAnimation() {
        imageView.layer.addAnimation(PKHUDAnimation.continuousRotation, forKey: "progressAnimation")
    }
    
    func stopAnimation() {
    }
}
