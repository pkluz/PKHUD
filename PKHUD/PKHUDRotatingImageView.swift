//
//  PKHUDRotatingImageView.swift
//  PKHUD
//
//  Created by Mark Koh on 1/14/16.
//  Copyright © 2016 NSExceptional. All rights reserved.
//  Licensed under the MIT license.
//

#if os(iOS) || os(watchOS)
    import UIKit
#elseif os(OSX)
    import Cocoa
#endif

import QuartzCore

/// PKHUDRotatingImageView provides a content view that rotates the supplies image automatically.
open class PKHUDRotatingImageView: PKHUDSquareBaseView, PKHUDAnimating {
    
    func startAnimation() {
        let imageViewLayer: CALayer! = imageView.layer
        imageViewLayer.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        imageViewLayer.position = CGPoint(x: self.frame.width/2, y: self.frame.height/2)
        imageViewLayer.add(PKHUDAnimation.continuousRotation, forKey: "progressAnimation")
    }
    
    func stopAnimation() {
    }
}
