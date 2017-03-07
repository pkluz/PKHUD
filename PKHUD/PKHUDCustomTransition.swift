//
//  PKHUDCustomTransition.swift
//  PKHUD
//
//  Created by JohnP on 3/3/17.
//  Copyright © 2017 NSExceptional. All rights reserved.
//

import Foundation
import QuartzCore

/// PKHUDCustomTransition provides a content view that custom trainsiton the supplied image automatically.
open class PKHUDCustomTransition: PKHUDSquareBaseView, PKHUDAnimating {
    public func startAnimation() {
        switch animationType {
        case .flip:
             imageView.layer.add(PKHUDAnimation.flipAnimation, forKey: "progressAnimation")
        case .fadeIn:
            imageView.layer.add(PKHUDAnimation.fadeInAnimation, forKey: "progressAnimation")
        case .rotate:
             imageView.layer.add(PKHUDAnimation.continuousRotation, forKey: "progressAnimation")
        }
    }
    public func stopAnimation() {
    }
}
