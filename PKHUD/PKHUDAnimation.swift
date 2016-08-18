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
        let animation = CAKeyframeAnimation(keyPath: "transform.rotation.z")
        
        let sliceTime = 1.0 * Float(M_PI) / 6.0
        let t1 = NSNumber(value: 1.0 * sliceTime)
        let t2 = NSNumber(value: 2.0 * sliceTime)
        let t3 = NSNumber(value: 3.0 * sliceTime)
        let t4 = NSNumber(value: 4.0 * sliceTime)
        let t5 = NSNumber(value: 5.0 * sliceTime)
        let t6 = NSNumber(value: 6.0 * sliceTime)
        let t7 = NSNumber(value: 7.0 * sliceTime)
        let t8 = NSNumber(value: 8.0 * sliceTime)
        let t9 = NSNumber(value: 9.0 * sliceTime)
        let t10 = NSNumber(value: 10.0 * sliceTime)
        let t11 = NSNumber(value: 11.0 * sliceTime)
        let t12 = NSNumber(value: 12.0 * sliceTime)
        animation.values = [t1,t2,t3,t4,t5,t6,t7,t8,t9,t10,t11,t12];

        let k0 = NSNumber(value: 0.0 / 12.0)
        let k1 = NSNumber(value: 1.0 / 12.0)
        let k2 = NSNumber(value: 2.0 / 12.0)
        let k3 = NSNumber(value: 3.0 / 12.0)
        let k4 = NSNumber(value: 4.0 / 12.0)
        let k5 = NSNumber(value: 5.0 / 12.0)
        let k6 = NSNumber(value: 6.0 / 12.0)
        let k7 = NSNumber(value: 7.0 / 12.0)
        let k8 = NSNumber(value: 8.0 / 12.0)
        let k9 = NSNumber(value: 9.0 / 12.0)
        let k10 = NSNumber(value: 10.0 / 12.0)
        let k11 = NSNumber(value: 11.0 / 12.0)
        let k12 = NSNumber(value: 12.0 / 12.0)
        animation.keyTimes = [k0,k1,k2,k3,k4,k5,k6,k7,k8,k9,k10,k11,k12];
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
