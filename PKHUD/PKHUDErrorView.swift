//
//  PKHUDErrorAnimation.swift
//  PKHUD
//
//  Created by Philip Kluz on 9/27/15.
//  Copyright (c) 2016 NSExceptional. All rights reserved.
//  Licensed under the MIT license.
//

import UIKit

/// PKHUDErrorView provides an animated error (cross) view.
open class PKHUDErrorView: PKHUDSquareBaseView, PKHUDAnimating {
    
    var dashOneLayer = PKHUDErrorView.generateDashLayer()
    var dashTwoLayer = PKHUDErrorView.generateDashLayer()
    
    class func generateDashLayer() -> CAShapeLayer {
        let dash = CAShapeLayer()
        dash.frame = CGRect(x: 0.0, y: 0.0, width: 88.0, height: 88.0)
        dash.path = {
            let path = UIBezierPath()
            path.move(to: CGPoint(x: 0.0, y: 44.0))
            path.addLine(to: CGPoint(x: 88.0, y: 44.0))
            return path.cgPath
        }()
        dash.lineCap     = kCALineCapRound
        dash.lineJoin    = kCALineJoinRound
        dash.fillColor   = nil
        dash.strokeColor = UIColor(red: 0.15, green: 0.15, blue: 0.15, alpha: 1.0).cgColor
        dash.lineWidth   = 6
        dash.fillMode    = kCAFillModeForwards
        return dash
    }
    
    public init(title: String? = nil, subtitle: String? = nil) {
        super.init(title: title, subtitle: subtitle)
        layer.addSublayer(dashOneLayer)
        layer.addSublayer(dashTwoLayer)
        dashOneLayer.position = layer.position
        dashTwoLayer.position = layer.position
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        layer.addSublayer(dashOneLayer)
        layer.addSublayer(dashTwoLayer)
        dashOneLayer.position = layer.position
        dashTwoLayer.position = layer.position
    }
    
    func rotationAnimation(_ angle: CGFloat) -> CABasicAnimation {
        var animation : CABasicAnimation
        if #available(iOS 9.0, *) {
            let springAnimation = CASpringAnimation(keyPath:"transform.rotation.z")
            springAnimation.damping = 1.5
            springAnimation.mass = 0.22
            springAnimation.initialVelocity = 0.5
            animation = springAnimation
        } else {
            animation = CABasicAnimation(keyPath:"transform.rotation.z")
        }
        
        animation.fromValue = 0.0
        animation.toValue = angle * CGFloat(M_PI / 180.0)
        animation.duration = 1.0
        animation.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseInEaseOut)
        return animation
    }
    
    func startAnimation() {
        let dashOneAnimation = rotationAnimation(-45.0)
        let dashTwoAnimation = rotationAnimation(45.0)
        
        dashOneLayer.transform = CATransform3DMakeRotation(-45 * CGFloat(M_PI/180), 0.0, 0.0, 1.0)
        dashTwoLayer.transform = CATransform3DMakeRotation(45 * CGFloat(M_PI/180), 0.0, 0.0, 1.0)
        
        dashOneLayer.add(dashOneAnimation, forKey: "dashOneAnimation")
        dashTwoLayer.add(dashTwoAnimation, forKey: "dashTwoAnimation")
    }

    func stopAnimation() {
        dashOneLayer.removeAnimation(forKey: "dashOneAnimation")
        dashTwoLayer.removeAnimation(forKey: "dashTwoAnimation")
    }
}
