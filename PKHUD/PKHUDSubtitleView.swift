//
//  PKHUDSubtitleView.swift
//  PKHUD
//
//  Created by Philip Kluz on 6/12/15.
//  Copyright (c) 2015 NSExceptional. All rights reserved.
//

import UIKit

/// PKHUDSubtitleView provides a square view, which you can use to display a picture and a subtitle (beneath the image).
public final class PKHUDSubtitleView: PKHUDImageView {
    
    public init(subtitle: String?, image: UIImage?) {
        super.init(image: image)
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
}
