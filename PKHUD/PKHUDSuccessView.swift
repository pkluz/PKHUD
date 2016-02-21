//
//  PKHUDCheckmarkView.swift
//  PKHUD
//
//  Created by Philip Kluz on 9/27/15.
//  Copyright (c) 2016 NSExceptional. All rights reserved.
//  Licensed under the MIT license.
//

import UIKit

/// PKHUDCheckmarkView provides an animated success (checkmark) view.
public class PKHUDSuccessView: PKHUDSquareBaseView, PKHUDAnimating {
    
    var checkmarkShapeLayer: CAShapeLayer = {
        let checkmarkPath = UIBezierPath()
        checkmarkPath.moveToPoint(CGPointMake(4.0, 27.0))
        checkmarkPath.addLineToPoint(CGPointMake(34.0, 56.0))
        checkmarkPath.addLineToPoint(CGPointMake(88.0, 0.0))
        
        let layer = CAShapeLayer()
        layer.frame = CGRectMake(3.0, 3.0, 88.0, 56.0)
        layer.path = checkmarkPath.CGPath
        layer.fillMode = kCAFillModeForwards
        layer.lineCap     = kCALineCapRound
        layer.lineJoin    = kCALineJoinRound
        layer.fillColor   = nil
        layer.strokeColor = UIColor(red: 0.15, green: 0.15, blue: 0.15, alpha: 1.0).CGColor
        layer.lineWidth   = 6.0
        return layer
    }()
    
    public init(title: String? = nil, subtitle: String? = nil) {
        super.init(title: title, subtitle: subtitle)
        layer.addSublayer(checkmarkShapeLayer)
        checkmarkShapeLayer.position = layer.position
    }
    
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        layer.addSublayer(checkmarkShapeLayer)
        checkmarkShapeLayer.position = layer.position
    }
    
    public func startAnimation() {
        let checkmarkStrokeAnimation = CAKeyframeAnimation(keyPath:"strokeEnd")
        checkmarkStrokeAnimation.values = [0, 1]
        checkmarkStrokeAnimation.keyTimes = [0, 1]
        checkmarkStrokeAnimation.duration = 0.35
        
        checkmarkShapeLayer.addAnimation(checkmarkStrokeAnimation, forKey:"checkmarkStrokeAnim")
    }
    
    public func stopAnimation() {
        checkmarkShapeLayer.removeAnimationForKey("checkmarkStrokeAnimation")
    }
}
