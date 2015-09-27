//
//  PKHUDAnimatingContentView.swift
//  PKHUD
//
//  Created by Philip Kluz on 9/27/15.
//  Copyright (c) 2015 NSExceptional. All rights reserved.
//

import UIKit

@objc protocol PKHUDAnimating {
    
    func startAnimation()
    optional func stopAnimation()
}

