//
//  PKHUDErrorAnimation.swift
//  PKHUD
//
//  Created by Philip Kluz on 9/27/15.
//  Copyright (c) 2015 NSExceptional. All rights reserved.
//

import UIKit

/// PKHUDErrorAnimation provides an animated error (cross) view.
public class PKHUDErrorAnimation: PKHUDSquareBaseView, PKHUDAnimating {
    
    var dashOneLayer: CAShapeLayer = {
        let dash = CAShapeLayer()
        dash.frame = CGRectMake(0.0, 0.0, 88.0, 88.0)
        dash.path = {
            let path = UIBezierPath()
            path.moveToPoint(CGPointMake(0.0, 44.0))
            path.addLineToPoint(CGPointMake(88.0, 44.0))
            return path.CGPath
        }()
        dash.lineCap     = kCALineCapRound
        dash.lineJoin    = kCALineJoinRound
        dash.fillColor   = nil
        dash.strokeColor = UIColor(red: 0.15, green: 0.15, blue: 0.15, alpha: 1.0).CGColor
        dash.lineWidth   = 6
        dash.fillMode = kCAFillModeForwards;
        
        return dash
    }()
    
    var dashTwoLayer: CAShapeLayer = {
        let dash = CAShapeLayer()
        dash.frame = CGRectMake(0.0, 0.0, 88.0, 88.0)
        dash.path = {
            let path = UIBezierPath()
            path.moveToPoint(CGPointMake(0.0, 44.0))
            path.addLineToPoint(CGPointMake(88.0, 44.0))
            return path.CGPath
            }()
        dash.lineCap     = kCALineCapRound
        dash.lineJoin    = kCALineJoinRound
        dash.fillColor   = nil
        dash.strokeColor = UIColor(red: 0.15, green: 0.15, blue: 0.15, alpha: 1.0).CGColor
        dash.lineWidth   = 6
        dash.fillMode = kCAFillModeForwards;
        
        return dash
    }()

    public override init() {
        super.init()
        layer.addSublayer(dashOneLayer)
        layer.addSublayer(dashTwoLayer)
        dashOneLayer.position = layer.position
        dashTwoLayer.position = layer.position
    }
    
    public required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        layer.addSublayer(dashOneLayer)
        layer.addSublayer(dashTwoLayer)
        dashOneLayer.position = layer.position
        dashTwoLayer.position = layer.position
    }
    
    //MARK: - Animation Setup
    
    func startAnimation() {
        let dashOneAnimation = CASpringAnimation(keyPath:"transform.rotation.z")
        dashOneAnimation.fromValue = 0.0
        dashOneAnimation.toValue = -45 * CGFloat(M_PI/180)
        dashOneAnimation.duration = 1.0
        dashOneAnimation.damping = 1.5
        dashOneAnimation.mass = 0.22
        dashOneAnimation.initialVelocity = 0.5
        dashOneAnimation.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseInEaseOut)
        
        let dashTwoAnimation = CASpringAnimation(keyPath:"transform.rotation.z")
        dashTwoAnimation.fromValue = 0.0
        dashTwoAnimation.toValue = 45 * CGFloat(M_PI/180)
        dashTwoAnimation.duration = 1.0
        dashTwoAnimation.damping = 1.5
        dashTwoAnimation.mass = 0.22
        dashTwoAnimation.initialVelocity = 0.5
        dashTwoAnimation.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseInEaseOut)
        
        dashOneLayer.transform = CATransform3DMakeRotation(-45 * CGFloat(M_PI/180), 0.0, 0.0, 1.0)
        dashTwoLayer.transform = CATransform3DMakeRotation(45 * CGFloat(M_PI/180), 0.0, 0.0, 1.0)
        
        dashOneLayer.addAnimation(dashOneAnimation, forKey: "dashOneAnimation")
        dashTwoLayer.addAnimation(dashTwoAnimation, forKey: "dashTwoAnimation")
    }

    func stopAnimation() {
        dashOneLayer.removeAnimationForKey("dashOneAnimation")
        dashTwoLayer.removeAnimationForKey("dashTwoAnimation")
    }
}
