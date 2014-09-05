//
//  HUDContentView.swift
//  PKHUD
//
//  Created by Philip Kluz on 6/17/14.
//  Copyright (c) 2014 NSExceptional. All rights reserved.
//

import UIKit
import QuartzCore

public struct HUDContentView {
    /// Provides a square view, which you can subclass and add additional views to.
    public class SquareBaseView: UIView {
        required public init(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
        }

        public override init(frame: CGRect = CGRect(origin: CGPointZero, size: CGSize(width: 156.0, height: 156.0))) {
            super.init(frame: frame)
        }
    }
    
    /// Provides a wide base view, which you can subclass and add additional views to.
    public class WideBaseView: UIView {
        required public init(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
        }

        public override init(frame: CGRect = CGRect(origin: CGPointZero, size: CGSize(width: 265.0, height: 90.0))) {
            super.init(frame: frame)
        }
    }
    
    /// Provides a wide, three line text view, which you can use to display information.
    public class TextView: WideBaseView {
        required public init(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
        }

        public init(text: String?) {
            super.init()
            
            titleLabel.text = text
            addSubview(titleLabel)
        }
        
        public override func layoutSubviews() {
            super.layoutSubviews()
            
            let padding: CGFloat = 10.0
            titleLabel.frame = CGRectInset(bounds, padding, padding)
        }
        
        internal let titleLabel: UILabel = {
            let label = UILabel()
            label.textAlignment = .Center
            label.font = UIFont.boldSystemFontOfSize(17.0)
            label.textColor = UIColor.blackColor().colorWithAlphaComponent(0.85)
            label.adjustsFontSizeToFitWidth = true
            label.numberOfLines = 3
            return label
        }()
    }
    
    /// Provides a square view, which you can use to display a single image.
    public class ImageView: SquareBaseView {
        required public init(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
        }

        public init(image: UIImage?) {
            super.init()
            
            imageView.image = image
            addSubview(imageView)
        }
        
        public override func layoutSubviews() {
            super.layoutSubviews()
            imageView.frame = bounds
        }
        
        internal let imageView: UIImageView = {
            let imageView = UIImageView()
            imageView.alpha = 0.85
            imageView.clipsToBounds = true
            imageView.contentMode = .Center
            return imageView
        }()
    }
    
    /// Provides a square (indeterminate) progress view.
    public final class ProgressView: ImageView {
        required public init(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
        }

        public init() {
            super.init(image: UIImage(named: "progress"))
            
            let progressImage = HUDAssets.progressImage
            
            imageView.image = progressImage
            imageView.layer.addAnimation({
                let animation = CABasicAnimation(keyPath: "transform.rotation.z")
                animation.toValue = NSNumber.numberWithFloat(2.0 * Float(M_PI))
                animation.duration = 0.65
                animation.cumulative = true
                animation.repeatCount = Float(INT_MAX)
                return animation
                }(), forKey: "transform.rotation.z")
            imageView.alpha = 0.9
        }
    }
    
    /// Provides a square view, which you can use to display a picture and a title (above the image).
    public final class TitleView: ImageView {
        required public init(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
        }

        public init(title: String?, image: UIImage?) {
            super.init(image: image)
            
            titleLabel.text = title
            addSubview(titleLabel)
        }
        
        public override func layoutSubviews() {
            super.layoutSubviews()
            
            let viewWidth: CGFloat = bounds.size.width
            let viewHeight: CGFloat = bounds.size.height
            
            let halfHeight = CGFloat(ceilf(CFloat(viewHeight / 2.0)))
            let quarterHeight = CGFloat(ceilf(CFloat(viewHeight / 4.0)))
            let threeQuarterHeight = CGFloat(ceilf(CFloat(viewHeight / 4.0 * 3.0)))
            
            let opticalOffset: CGFloat = 10.0
            
            titleLabel.frame = CGRect(origin: CGPoint(x:0.0, y:opticalOffset), size: CGSize(width: viewWidth, height: quarterHeight))
            imageView.frame = CGRect(origin: CGPoint(x:0.0, y:quarterHeight - opticalOffset), size: CGSize(width: viewWidth, height: threeQuarterHeight))
        }
        
        internal let titleLabel: UILabel = {
            let label = UILabel()
            label.textAlignment = .Center
            label.font = UIFont.boldSystemFontOfSize(17.0)
            label.textColor = UIColor.blackColor().colorWithAlphaComponent(0.85)
            return label
        }()
    }
    
    /// Provides a square view, which you can use to display a picture and a subtitle (beneath the image).
    public final class SubtitleView: ImageView {
        required public init(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
        }

        public init(subtitle: String?, image: UIImage?) {
            super.init(image: image)
            
            subtitleLabel.text = subtitle
            addSubview(subtitleLabel)
        }
        
        public override func layoutSubviews() {
            super.layoutSubviews()
            
            let viewWidth: CGFloat = bounds.size.width
            let viewHeight: CGFloat = bounds.size.height
            
            let halfHeight = CGFloat(ceilf(CFloat(viewHeight / 2.0)))
            let quarterHeight = CGFloat(ceilf(CFloat(viewHeight / 4.0)))
            let threeQuarterHeight = CGFloat(ceilf(CFloat(viewHeight / 4.0 * 3.0)))
            
            let opticalOffset: CGFloat = 10.0
            
            imageView.frame = CGRect(origin: CGPoint(x: 0.0, y: opticalOffset), size: CGSize(width: viewWidth, height: threeQuarterHeight - opticalOffset))
            subtitleLabel.frame = CGRect(origin: CGPoint(x:0.0, y:threeQuarterHeight - opticalOffset), size: CGSize(width: viewWidth, height: quarterHeight))
        }
        
        internal let subtitleLabel: UILabel = {
            let label = UILabel()
            label.textAlignment = .Center
            label.font = UIFont.boldSystemFontOfSize(17.0)
            label.textColor = UIColor.blackColor().colorWithAlphaComponent(0.85)
            label.adjustsFontSizeToFitWidth = true
            label.numberOfLines = 2
            return label
        }()
    }
    
    /// Provides a square view, which you can use to display a picture, a title and a subtitle. This type of view replicates the Apple HUD one to one.
    public final class StatusView: ImageView {
        required public init(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
        }

        public init(title: String?, subtitle: String?, image: UIImage?) {
            super.init(image: image)
            
            titleLabel.text = title
            subtitleLabel.text = subtitle
            
            addSubview(titleLabel)
            addSubview(subtitleLabel)
        }
        
        public override func layoutSubviews() {
            super.layoutSubviews()
            
            let viewWidth = bounds.size.width
            let viewHeight = bounds.size.height
            
            let halfHeight = CGFloat(ceilf(CFloat(viewHeight / 2.0)))
            let quarterHeight = CGFloat(ceilf(CFloat(viewHeight / 4.0)))
            let threeQuarterHeight = CGFloat(ceilf(CFloat(viewHeight / 4.0 * 3.0)))
            
            titleLabel.frame = CGRect(origin: CGPointZero, size: CGSize(width: viewWidth, height: quarterHeight))
            imageView.frame = CGRect(origin: CGPoint(x:0.0, y:quarterHeight), size: CGSize(width: viewWidth, height: halfHeight))
            subtitleLabel.frame = CGRect(origin: CGPoint(x:0.0, y:threeQuarterHeight), size: CGSize(width: viewWidth, height: quarterHeight))
        }
        
        internal let titleLabel: UILabel = {
            let label = UILabel()
            label.textAlignment = .Center
            label.font = UIFont.boldSystemFontOfSize(17.0)
            label.textColor = UIColor.blackColor().colorWithAlphaComponent(0.85)
            return label
        }()
        
        internal let subtitleLabel: UILabel = {
            let label = UILabel()
            label.textAlignment = .Center
            label.font = UIFont.systemFontOfSize(14.0)
            label.textColor = UIColor.blackColor().colorWithAlphaComponent(0.7)
            label.adjustsFontSizeToFitWidth = true
            label.numberOfLines = 2
            return label
        }()
    }
}
