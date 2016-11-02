//
//  PKHUDSystemActivityIndicatorView.swift
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

/// PKHUDSystemActivityIndicatorView provides the system UIActivityIndicatorView as an alternative.
public final class PKHUDSystemActivityIndicatorView: PKHUDSquareBaseView, PKHUDAnimating {
    
    public init() {
        super.init(image: nil, title: nil, subtitle: nil)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func commonInit () {
        super.commonInit()
        
        let layer: CALayer! = self.layer
        layer.backgroundColor = Color.clear.cgColor
        
        #if os(iOS) || os(watchOS)
            alpha = 0.8
        #elseif os(OSX)
            alphaValue = 0.8
        #endif
        
        self.addSubview(activityIndicator)
        
        setCorrectFrames()
    }
    
    override func setCorrectFrames() {
        super.setCorrectFrames()
        
        let x = (self.frame.width - activityIndicator.frame.width) / 2
        let y = (self.frame.height - activityIndicator.frame.height) / 2
        
        activityIndicator.frame.origin = CGPoint(x: x, y: y)
    }
    
    #if os(iOS) || os(watchOS)
    let activityIndicator: UIActivityIndicatorView = {
        let activity = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
        activity.color = UIColor.black
        return activity
    }()
    #elseif os(OSX)
    let activityIndicator: NSProgressIndicator = {
        let indicator = NSProgressIndicator(frame: NSRect(x: 0, y: 0, width: 40, height: 40))
        indicator.wantsLayer = true
        indicator.style = .spinningStyle
        return indicator
    }()
    #endif
    
    func startAnimation() {
        #if os(iOS) || os(watchOS)
            activityIndicator.startAnimating()
        #elseif os(OSX)
            activityIndicator.startAnimation(self)
        #endif
    }
}
