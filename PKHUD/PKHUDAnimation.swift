//
//  PKHUDAnimation.swift
//  PKHUD
//
//  Created by Piergiuseppe Longo on 06/01/16.
//  Copyright © 2016 Piergiuseppe Longo, NSExceptional. All rights reserved.
//  Licensed under the MIT license.
//

import Foundation
import QuartzCore

public final class PKHUDAnimation {

    public static let discreteRotation: CAAnimation = {
        let animation = CAKeyframeAnimation(keyPath: "transform.rotation.z")
        animation.values = [
            NSNumber(value: 0.0 as Float),
            NSNumber(value: 1.0 * Float(Double.pi) / 6.0 as Float),
            NSNumber(value: 2.0 * Float(Double.pi) / 6.0 as Float),
            NSNumber(value: 3.0 * Float(Double.pi) / 6.0 as Float),
            NSNumber(value: 4.0 * Float(Double.pi) / 6.0 as Float),
            NSNumber(value: 5.0 * Float(Double.pi) / 6.0 as Float),
            NSNumber(value: 6.0 * Float(Double.pi) / 6.0 as Float),
            NSNumber(value: 7.0 * Float(Double.pi) / 6.0 as Float),
            NSNumber(value: 8.0 * Float(Double.pi) / 6.0 as Float),
            NSNumber(value: 9.0 * Float(Double.pi) / 6.0 as Float),
            NSNumber(value: 10.0 * Float(Double.pi) / 6.0 as Float),
            NSNumber(value: 11.0 * Float(Double.pi) / 6.0 as Float),
            NSNumber(value: 2.0 * Float(Double.pi) as Float)
        ]
        animation.keyTimes = [
            NSNumber(value: 0.0 as Float),
            NSNumber(value: 1.0 / 12.0 as Float),
            NSNumber(value: 2.0 / 12.0 as Float),
            NSNumber(value: 3.0 / 12.0 as Float),
            NSNumber(value: 4.0 / 12.0 as Float),
            NSNumber(value: 5.0 / 12.0 as Float),
            NSNumber(value: 0.5 as Float),
            NSNumber(value: 7.0 / 12.0 as Float),
            NSNumber(value: 8.0 / 12.0 as Float),
            NSNumber(value: 9.0 / 12.0 as Float),
            NSNumber(value: 10.0 / 12.0 as Float),
            NSNumber(value: 11.0 / 12.0 as Float),
            NSNumber(value: 1.0 as Float)
        ]
        animation.duration = 1.2
        animation.calculationMode = "discrete"
        animation.repeatCount = Float(INT_MAX)
        return animation
    }()

    static let continuousRotation: CAAnimation = {
        let animation = CABasicAnimation(keyPath: "transform.rotation.z")
        animation.fromValue = 0
        animation.toValue = 2.0 * Double.pi
        animation.duration = 1.2
        animation.repeatCount = Float(INT_MAX)
        return animation
    }()
    
    static let customAnimation: CAAnimation = {
        let playing = true
        let flip = CABasicAnimation(keyPath: "transform")
        var t = CATransform3DIdentity
        var z = CATransform3DIdentity
        t.m34 = 1/1000.0
        t = CATransform3DRotate(t, CGFloat(M_PI) * (playing ? 0.5 : 1.5), 0, 1, 0)
        flip.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        flip.fromValue = NSValue(caTransform3D: z)
        flip.toValue = NSValue(caTransform3D: t)
        flip.repeatCount = Float(INT_MAX)
        flip.duration = 0.15
        return flip
    }()
    
    static let flipAnimation: CAAnimation = {
        let flip = CABasicAnimation(keyPath: "transform.rotation.y")
        flip.fromValue = 0
        flip.toValue = Double(1) * 2 * M_PI
        flip.duration = CFTimeInterval(1)
        flip.repeatCount = Float(INT_MAX)
        return flip
    }()
}
