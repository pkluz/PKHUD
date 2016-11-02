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
        #if os(iOS) || os(watchOS)
            titleLabel.text = text
        #elseif os(OSX)
            titleLabel.stringValue = text ?? ""
        #endif
        
        addSubview(titleLabel)

        setCorrectFrames()
    }
    
    #if os(iOS) || os(watchOS)
        public let titleLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.textAlignment = .center
            label.font = UIFont.boldSystemFont(ofSize: 17.0)
            label.textColor = UIColor.black.withAlphaComponent(0.85)
            label.adjustsFontSizeToFitWidth = true
            label.numberOfLines = 3
            return label
        }()
    #elseif os(OSX)
        open let titleLabel: NSTextField = {
            let textField = NSTextField()
            textField.alignment = .center
            textField.translatesAutoresizingMaskIntoConstraints = false
            textField.font = NSFont.systemFont(ofSize: 17.0)
            textField.textColor = Color.black.withAlphaComponent(0.85)
            textField.maximumNumberOfLines = 3
            textField.isBezeled = false
            textField.drawsBackground = false
            textField.isEditable = false
            textField.isSelectable = false
            return textField
        }()
    #endif
    
    func setCorrectFrames() {
        translatesAutoresizingMaskIntoConstraints = false
        let left = NSLayoutConstraint(item: titleLabel, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: 10)
        let right = NSLayoutConstraint(item: titleLabel, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1, constant: -10)
        
        let centerY = NSLayoutConstraint(item: titleLabel, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0)
        
        self.addConstraints([left, right])
        self.addConstraints([centerY])
    }
}
