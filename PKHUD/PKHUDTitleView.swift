//
//  PKHUDTitleView.swift
//  PKHUD
//
//  Created by Philip Kluz on 6/12/15.
//  Copyright (c) 2015 NSExceptional. All rights reserved.
//

import UIKit

/// PKHUDTitleView provides a square view, which you can use to display a picture and a title (above the image).
public final class PKHUDTitleView: PKHUDImageView {
    
    public init(title: String?, image: UIImage?) {
        super.init(image: image)
        commonInit(title: title)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit(title: "");
    }
    
    func commonInit(title title: String?) {
        titleLabel.text = title
        addSubview(titleLabel)
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        let viewWidth = bounds.size.width
        let viewHeight = bounds.size.height
        
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
