//
//  HUDContentView.swift
//  PKHUD
//
//  Created by Philip Kluz on 6/17/14.
//  Copyright (c) 2014 NSExceptional. All rights reserved.
//

import UIKit
import QuartzCore

let defaultFrameWBV = CGRect(origin: CGPointZero, size: CGSize(width: 265.0, height: 90.0))
private let defaultSquareFrame = CGRect(origin: CGPointZero, size: CGSize(width: 156.0, height: 156.0))


/// Provides a square view, which you can subclass and add additional views to.
@objc public class PKHUDSquareBaseView: UIView {

    public init() {
      super.init(frame: CGRect(origin: CGPointZero, size: CGSize(width: 156.0, height: 156.0)))
    }

    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    public required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

/// Provides a wide base view, which you can subclass and add additional views to.
@objc public class PKHUDWideBaseView: UIView {

    public init() {
      super.init(frame: CGRect(origin: CGPointZero, size: CGSize(width: 265.0, height: 90.0)))
    }

    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    public required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

/// Provides a wide, three line text view, which you can use to display information.
@objc public class PKHUDTextView: PKHUDWideBaseView {
    public init(text: String?) {
        super.init()
        commonInit(text)
    }
    
    public required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit("")
    }
    
    private func commonInit(text: String?) {
        titleLabel.text = text
        addSubview(titleLabel)
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        let padding: CGFloat = 10.0
        titleLabel.frame = CGRectInset(bounds, padding, padding)
    }
    
    public let titleLabel: UILabel = {
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
@objc public class PKHUDImageView: PKHUDSquareBaseView {
    public init(image: UIImage?) {
        super.init()
        commonInit(image)
    }
    
    public required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit(nil)
    }
    
    private func commonInit(image: UIImage?) {
        imageView.image = image
        addSubview(imageView)
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = bounds
    }
    
    public let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.alpha = 0.85
        imageView.clipsToBounds = true
        imageView.contentMode = .Center
        return imageView
        }()
}

/// Provides a square (indeterminate) progress view.
@objc public final class PKHUDProgressView: PKHUDImageView {
    public init() {
        super.init(image: UIImage(named: "progress"))
    }
    
    public required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private override func commonInit(image: UIImage?) {
        super.commonInit(image)
        
        let progressImage = PKHUDAssets.progressImage
        
        imageView.image = progressImage
        imageView.layer.addAnimation({
            let animation = CABasicAnimation(keyPath: "transform.rotation.z")
            animation.toValue = NSNumber(float: 2.0 * Float(M_PI))
            animation.duration = 1.2
            animation.cumulative = true
            animation.repeatCount = Float(INT_MAX)
            return animation
            }(), forKey: "transform.rotation.z")
        imageView.alpha = 0.9
    }
}

//// Provides the system UIActivityIndicatorView as an alternative.
@objc public final class PKHUDSystemActivityIndicatorView: UIView {
    
    required public init() {
        super.init(frame: CGRectMake(0.0, 0.0, 120.0, 120.0))
        self.commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    required public init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func commonInit () {
        self.backgroundColor = UIColor.clearColor()
        self.alpha = 0.8
        
        let activity = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.WhiteLarge)
        activity.color = UIColor.blackColor()
        activity.startAnimating()
        
        self.addSubview(activity)
        
        activity.center = self.center
    }
}

/// Provides a square view, which you can use to display a picture and a title (above the image).
@objc public final class PKHUDTitleView: PKHUDImageView {
    public init(title: String?, image: UIImage?) {
        super.init(image: image)
        commonInit(title)
    }
    
    public required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit("");
    }
    
    private func commonInit(title: String?) {
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
    
    public let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .Center
        label.font = UIFont.boldSystemFontOfSize(17.0)
        label.textColor = UIColor.blackColor().colorWithAlphaComponent(0.85)
        return label
        }()
}

/// Provides a square view, which you can use to display a picture and a subtitle (beneath the image).
@objc public final class PKHUDSubtitleView: PKHUDImageView {
    public init(subtitle: String?, image: UIImage?) {
        super.init(image: image)
        commonInit(subtitle)
    }
    
    public required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit("");
    }
    
    private func commonInit(subtitle: String?) {
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
    
    public let subtitleLabel: UILabel = {
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
@objc public final class PKHUDStatusView: PKHUDImageView {
    public init(title: String?, subtitle: String?, image: UIImage?) {
        super.init(image: image)
        commonInit(title, subtitle: subtitle)
    }
    
    public required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit("", subtitle: "")
    }
    
    private func commonInit(title: String?, subtitle: String?) {
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
    
    public let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .Center
        label.font = UIFont.boldSystemFontOfSize(17.0)
        label.textColor = UIColor.blackColor().colorWithAlphaComponent(0.85)
        return label
        }()
    
    public let subtitleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .Center
        label.font = UIFont.systemFontOfSize(14.0)
        label.textColor = UIColor.blackColor().colorWithAlphaComponent(0.7)
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 2
        return label
        }()
}
