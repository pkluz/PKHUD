//
//  PKHUDTextView.swift
//  PKHUD
//
//  Created by Philip Kluz on 6/12/15.
//  Copyright (c) 2015 NSExceptional. All rights reserved.
//

import UIKit

/// PKHUDTextView provides a wide, three line text view, which you can use to display information.
public class PKHUDTextView: PKHUDWideBaseView {
    
    public init(text: String?) {
        super.init()
        commonInit(text)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit("")
    }
    
    func commonInit(text: String?) {
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
