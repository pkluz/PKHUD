//
//  PKHUDProgressInfoView.swift
//  PKHUD
//
//  Created by Nahit Rustu Heper on 08/01/16.
//  Copyright © 2016 NSExceptional. All rights reserved.
//

import UIKit
import QuartzCore

/// PKHUDProgressView provides an indeterminate progress view.
public class PKHUDProgressInfoView: PKHUDImageView, PKHUDAnimating {
    
    public init(subtitle: String?) {
        super.init(image: PKHUDAssets.progressImage)
        commonInit(subtitle: subtitle)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit(subtitle: "");
    }
    func commonInit(subtitle subtitle: String?) {
        subtitleLabel.text = subtitle
        addSubview(subtitleLabel)
    }
    override func commonInit(image image: UIImage?) {
        super.commonInit(image: image)
        
        let progressImage = PKHUDAssets.progressImage
        imageView.image = progressImage
        imageView.alpha = 0.9
    }
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        let viewWidth = bounds.size.width
        let viewHeight = bounds.size.height
        
        let quarterHeight = CGFloat(ceilf(CFloat(viewHeight / 4.0)))
        let threeQuarterHeight = CGFloat(ceilf(CFloat(viewHeight / 4.0 * 3.0)))
        
        let opticalOffset: CGFloat = 10.0
        
        imageView.frame = CGRect(origin: CGPoint(x: 0.0, y: opticalOffset), size: CGSize(width: viewWidth, height: threeQuarterHeight - opticalOffset))
        subtitleLabel.frame = CGRect(origin: CGPoint(x:0.0, y:threeQuarterHeight - opticalOffset), size: CGSize(width: viewWidth, height: quarterHeight))
    }
    
    public let subtitleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .Center
        label.font = UIFont.boldSystemFontOfSize(17.0)
        label.textColor = UIColor.blackColor().colorWithAlphaComponent(0.85)
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 2
        return label
    }()
    
    let progressAnimation: CAKeyframeAnimation = {
        let animation = CAKeyframeAnimation(keyPath: "transform.rotation.z")
        animation.values = [
            NSNumber(float: 0.0),
            NSNumber(float: 1.0 * Float(M_PI) / 6.0),
            NSNumber(float: 2.0 * Float(M_PI) / 6.0),
            NSNumber(float: 3.0 * Float(M_PI) / 6.0),
            NSNumber(float: 4.0 * Float(M_PI) / 6.0),
            NSNumber(float: 5.0 * Float(M_PI) / 6.0),
            NSNumber(float: 6.0 * Float(M_PI) / 6.0),
            NSNumber(float: 7.0 * Float(M_PI) / 6.0),
            NSNumber(float: 8.0 * Float(M_PI) / 6.0),
            NSNumber(float: 9.0 * Float(M_PI) / 6.0),
            NSNumber(float: 10.0 * Float(M_PI) / 6.0),
            NSNumber(float: 11.0 * Float(M_PI) / 6.0),
            NSNumber(float: 2.0 * Float(M_PI))
        ]
        animation.keyTimes = [
            NSNumber(float: 0.0),
            NSNumber(float: 1.0 / 12.0),
            NSNumber(float: 2.0 / 12.0),
            NSNumber(float: 3.0 / 12.0),
            NSNumber(float: 4.0 / 12.0),
            NSNumber(float: 5.0 / 12.0),
            NSNumber(float: 0.5),
            NSNumber(float: 7.0 / 12.0),
            NSNumber(float: 8.0 / 12.0),
            NSNumber(float: 9.0 / 12.0),
            NSNumber(float: 10.0 / 12.0),
            NSNumber(float: 11.0 / 12.0),
            NSNumber(float: 1.0)
        ]
        animation.duration = 1.2
        animation.calculationMode = "discrete"
        animation.repeatCount = Float(INT_MAX)
        return animation
    }()
    
    func startAnimation() {
        imageView.layer.addAnimation(progressAnimation, forKey: "progressAnimation")
    }
    
    func stopAnimation() {
    }
}
