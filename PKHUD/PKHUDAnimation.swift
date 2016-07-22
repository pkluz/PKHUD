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
    
    static let discreteRotation: CAAnimation = {
        let animation = CAKeyframeAnimation.init(keyPath: "transform.rotation.z")
        // NSNumber(value: 1.0 * Float.pi / 6.0) because of time spend, solve it
        animation.values = [
            0.0,
            0.52,
            1.04,
            1.57,
            2.09,
            2.61,
            3.14,
            3.63,
            4.18,
            4.71,
            5.16,
            5.75,
            6.28
        ];
        animation.keyTimes = [
            0.0,
            0.08,
            0.16,
            0.25,
            0.33,
            0.41,
            0.5,
            0.58,
            0.66,
            0.75,
            0.83,
            0.91,
            1.0
        ]
        animation.duration = 1.2
        animation.calculationMode = "discrete"
        animation.repeatCount = Float(INT_MAX)
        return animation
    }()

    
    static let continuousRotation: CAAnimation = {
        let animation = CABasicAnimation(keyPath: "transform.rotation.z")
        animation.fromValue = 0
        animation.toValue = 2.0 * M_PI
        animation.duration = 1.2
        animation.repeatCount = Float(INT_MAX)
        return animation
    }()
}
