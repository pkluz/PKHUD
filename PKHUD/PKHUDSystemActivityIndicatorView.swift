//
//  PKHUDSystemActivityIndicatorView.swift
//  PKHUD
//
//  Created by Philip Kluz on 6/12/15.
//  Copyright © 2015 NSExceptional. All rights reserved.
//

import UIKit

/// PKHUDSystemActivityIndicatorView provides the system UIActivityIndicatorView as an alternative.
public final class PKHUDSystemActivityIndicatorView: PKHUDSquareBaseView {
    
    public override init() {
        super.init(frame: PKHUDSquareBaseView.defaultSquareBaseViewFrame)
        self.commonInit()
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }
    
    func commonInit () {
        self.backgroundColor = UIColor.clearColor()
        self.alpha = 0.8
        
        let activity = UIActivityIndicatorView(activityIndicatorStyle: .WhiteLarge)
        activity.color = UIColor.blackColor()
        activity.startAnimating()
        
        self.addSubview(activity)
        
        activity.center = self.center
    }
}
