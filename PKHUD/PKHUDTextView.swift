//
//  PKHUDTextView.swift
//  PKHUD
//
//  Created by Philip Kluz on 6/12/15.
//  Copyright (c) 2016 NSExceptional. All rights reserved.
//  Licensed under the MIT license.
//

#if os(iOS) || os(watchOS)
    import UIKit
#elseif os(OSX)
    import Cocoa
#endif

/// PKHUDTextView provides a wide, three line text view, which you can use to display information.
open class PKHUDTextView: PKHUDWideBaseView {
    
    public init(text: String?) {
        super.init()
        commonInit(text)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit("")
    }
    
    func commonInit(_ text: String?) {
        titleLabel.text = text
        addSubview(titleLabel)
        
        layoutIfNeeded()
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        
        let padding: CGFloat = 10.0
        titleLabel.frame = bounds.insetBy(dx: padding, dy: padding)
        
        let maxHeight = titleLabel.frame.height
        let calcHeight = min(titleLabel.size().height, maxHeight)
        let newY = (maxHeight - calcHeight) / 2 + padding
        titleLabel.frame.size.height = calcHeight
        titleLabel.frame.origin.y = newY
    }
    
    open let titleLabel: Label = {
        let label = Label()
        label.textAlignment = .center
        label.font = Font.labelViewFont
        label.textColor = Color.black.withAlphaComponent(0.85)
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 3
        return label
    }()
}
