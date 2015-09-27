//
//  PKHUDSystemActivityIndicatorView.swift
//  PKHUD
//
//  Created by Philip Kluz on 6/12/15.
//  Copyright (c) 2015 NSExceptional. All rights reserved.
//

import UIKit

/// PKHUDSystemActivityIndicatorView provides the system UIActivityIndicatorView as an alternative.
public final class PKHUDSystemActivityIndicatorView: PKHUDSquareBaseView, PKHUDAnimating {
    
    public override init() {
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
        backgroundColor = UIColor.clearColor()
        alpha = 0.8
        
        self.addSubview(activityIndicatorView)
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        activityIndicatorView.center = self.center
    }
    
    let activityIndicatorView: UIActivityIndicatorView = {
        let activity = UIActivityIndicatorView(activityIndicatorStyle: .WhiteLarge)
        activity.color = UIColor.blackColor()
        return activity
    }()
    
    func startAnimation() {
        activityIndicatorView.startAnimating()
    }
}
