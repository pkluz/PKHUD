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
        super.init(frame: PKHUDSquareBaseView.defaultSquareBaseViewFrame)
        commonInit()
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit () {
        self.backgroundColor = Color.clear
        self.alpha = 0.8
        
        self.addSubview(activityIndicatorView)
        
        self.layoutIfNeeded()
    }
    
    let activityIndicatorView: ActivityIndicatorView = {
        let activity = ActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
        activity.color = Color.black
        return activity
    }()
    
    func startAnimation() {
        activityIndicatorView.startAnimating()
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        let x = (self.frame.width - activityIndicatorView.frame.width) / 2
        let y = (self.frame.height - activityIndicatorView.frame.height) / 2

        activityIndicatorView.frame.origin = CGPoint(x: x, y: y)
    }
}
