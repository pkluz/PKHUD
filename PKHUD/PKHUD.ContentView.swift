//
//  HUDContentView.swift
//  PKHUD
//
//  Created by Philip Kluz on 6/17/14.
//  Copyright (c) 2014 NSExceptional. All rights reserved.
//

import UIKit
import QuartzCore

extension PKHUD {
    /**
        Provides a set of classes that can be customized and inserted as the PKHUD's contentView.
    
        @example
            PKHUD.Controller.sharedController.contentView = YOUR_CONTENT_VIEW
    */
    struct ContentViews {
        class SquareBaseView: UIView {
            init(frame: CGRect = CGRect(origin: CGPointZero, size: CGSize(width: 156.0, height: 156.0))) {
                super.init(frame: frame)
            }
        }
        
        class WideBaseView: UIView {
            init(frame: CGRect = CGRect(origin: CGPointZero, size: CGSize(width: 265.0, height: 90.0))) {
                super.init(frame: frame)
            }
        }
        
        class TextView: WideBaseView {
            init(text: String?) {
                super.init()
                
                titleLabel.text = text
                addSubview(titleLabel)
            }
            
            override func layoutSubviews() {
                super.layoutSubviews()
                
                let padding: CGFloat = 10.0
                titleLabel.frame = CGRectInset(bounds, padding, padding)
            }
            
            let titleLabel: UILabel = {
                let label = UILabel()
                label.textAlignment = .Center
                label.font = UIFont.boldSystemFontOfSize(17.0)
                label.textColor = UIColor.blackColor().colorWithAlphaComponent(0.85)
                label.adjustsFontSizeToFitWidth = true
                label.numberOfLines = 3
                return label
            }()
        }
        
        class ImageView: SquareBaseView {
            init(image: UIImage?) {
                super.init()
                
                imageView.image = image
                
                addSubview(imageView)
            }
            
            override func layoutSubviews() {
                super.layoutSubviews()
                imageView.frame = bounds
            }
            
            let imageView: UIImageView = {
                let imageView = UIImageView()
                imageView.alpha = 0.85
                imageView.clipsToBounds = true
                imageView.contentMode = .Center
                return imageView
            }()
        }
        
        @final class ProgressView: ImageView {
            init() {
                super.init(image: UIImage(named: "progress"))
                
                let progressImage = PKHUD.Assets.progressImage
               
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
        
        @final class TitleView: ImageView {
            init(title: String?, image: UIImage?) {
                super.init(image: image)
                
                titleLabel.text = title
                addSubview(titleLabel)
            }
            
            override func layoutSubviews() {
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
            
            let titleLabel: UILabel = {
                let label = UILabel()
                label.textAlignment = .Center
                label.font = UIFont.boldSystemFontOfSize(17.0)
                label.textColor = UIColor.blackColor().colorWithAlphaComponent(0.85)
                return label
            }()
        }
        
        @final class SubtitleView: ImageView {
            init(subtitle: String?, image: UIImage?) {
                super.init(image: image)
                
                subtitleLabel.text = subtitle
                
                addSubview(subtitleLabel)
            }
            
            override func layoutSubviews() {
                super.layoutSubviews()
                
                let viewWidth: CGFloat = bounds.size.width
                let viewHeight: CGFloat = bounds.size.height
                
                let halfHeight = CGFloat(ceilf(CFloat(viewHeight / 2.0)))
                let quarterHeight = CGFloat(ceilf(CFloat(viewHeight / 4.0)))
                let threeQuarterHeight = CGFloat(ceilf(CFloat(viewHeight / 4.0 * 3.0)))
                
                let opticalOffset: CGFloat = 10.0
                
                imageView.frame = CGRect(origin: CGPoint(x: 0.0, y: opticalOffset), size: CGSize(width: viewWidth, height: threeQuarterHeight - opticalOffset))
                subtitleLabel.frame = CGRect(origin: CGPoint(x:0.0, y:threeQuarterHeight - opticalOffset), size: CGSize(width: viewWidth, height: quarterHeight - opticalOffset))
            }
            
            let subtitleLabel: UILabel = {
                let label = UILabel()
                label.textAlignment = .Center
                label.font = UIFont.boldSystemFontOfSize(17.0)
                label.textColor = UIColor.blackColor().colorWithAlphaComponent(0.85)
                label.adjustsFontSizeToFitWidth = true
                label.numberOfLines = 2
                return label
            }()
        }
        
        @final class StatusView: ImageView {
            init(title: String?, subtitle: String?, image: UIImage?) {
                super.init(image: image)
                
                titleLabel.text = title
                subtitleLabel.text = subtitle
                
                addSubview(titleLabel)
                addSubview(subtitleLabel)
            }
            
            override func layoutSubviews() {
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
            
            let titleLabel: UILabel = {
                let label = UILabel()
                label.textAlignment = .Center
                label.font = UIFont.boldSystemFontOfSize(17.0)
                label.textColor = UIColor.blackColor().colorWithAlphaComponent(0.85)
                return label
            }()
            
            let subtitleLabel: UILabel = {
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
}
