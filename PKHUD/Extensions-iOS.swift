//
//  Extensions-iOS.swift
//  PKHUD
//
//  Created by Fabian Renner on 08.11.16.
//  Copyright © 2016 NSExceptional. All rights reserved.
//

import UIKit

public typealias View = UIView
public typealias Img = UIImage
public typealias Color = UIColor
public typealias VisualEffectView = UIVisualEffectView
public typealias ImageView = UIImageView
public typealias BezierPath = UIBezierPath
public typealias BlurEffect = UIBlurEffect
public typealias Font = UIFont
public typealias ActivityIndicatorView = UIActivityIndicatorView
public typealias Label = UILabel

extension UIView {
    func removeAllAnimations() {
        layer.removeAllAnimations()
    }
    
    func add(_ anim: CAAnimation, forKey: String?) {
        self.layer.add(anim, forKey: forKey)
    }
    
    var cornerRadius: CGFloat {
        get {
            return self.layer.cornerRadius
        }
        set (radius) {
            self.layer.cornerRadius = radius
        }
    }
    
    var masksToBounds: Bool {
        get {
            return self.layer.masksToBounds
        }
        set (masks) {
            self.layer.masksToBounds = masks
        }
    }
    
    func addSublayer(_ layer: CALayer) {
        self.layer.addSublayer(layer)
    }
    
    var position: CGPoint {
        get {
            return self.layer.position
        }
        set {
            self.layer.position = newValue
        }
    }
}

extension UILabel {
    func size() -> CGSize {
        return self.sizeThatFits(CGSize(width: self.frame.width, height: CGFloat(Int.max)))
    }
}

extension UIFont {
    static var labelViewFont: UIFont {
        return UIFont.boldSystemFont(ofSize: 17.0)
    }
}
