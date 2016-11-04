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
    public enum NSActivityIndicatorViewStyle : Int {
        case whiteLarge
        case white
        case gray
    }
    
    public class NSActivityIndicatorView: NSProgressIndicator {
        public init(activityIndicatorStyle style: NSActivityIndicatorViewStyle) {
            super.init(frame: CGRect.zero)
            
            self.wantsLayer = true
            self.style = .spinningStyle
        }
        
        required public init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        public func startAnimating() {
            self.startAnimation(nil)
        }
        
        public var color: Color {
            get {
                return Color.black
            }
            set {}
        }
    }
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
