//
//  PKHUDAnimatingContentView.swift
//  PKHUD
//
//  Created by Philip Kluz on 9/27/15.
//  Copyright (c) 2016 NSExceptional. All rights reserved.
//  Licensed under the MIT license.
//

import UIKit

@objc public protocol PKHUDAnimating {

    func startAnimation()
    @objc optional func stopAnimation()
}
