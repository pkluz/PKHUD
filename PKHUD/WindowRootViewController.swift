//
//  PKHUD.WindowRootViewController.swift
//  PKHUD
//
//  Created by Philip Kluz on 6/18/14.
//  Copyright (c) 2016 NSExceptional. All rights reserved.
//  Licensed under the MIT license.
//

import UIKit

/// Serves as a configuration relay controller, tapping into the main window's rootViewController settings.
internal class WindowRootViewController: UIViewController {
    
    #if os(iOS)
    internal override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        if let rootViewController = UIApplication.sharedApplication().delegate?.window??.rootViewController {
            return rootViewController.supportedInterfaceOrientations()
        } else {
            return UIInterfaceOrientationMask.Portrait
        }
    }
    
    internal override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return self.presentingViewController?.preferredStatusBarStyle() ?? UIApplication.sharedApplication().statusBarStyle
    }
    
    internal override func prefersStatusBarHidden() -> Bool {
        return self.presentingViewController?.prefersStatusBarHidden() ?? UIApplication.sharedApplication().statusBarHidden
    }
    
    internal override func preferredStatusBarUpdateAnimation() -> UIStatusBarAnimation {
        if let rootViewController = UIApplication.sharedApplication().delegate?.window??.rootViewController {
            return rootViewController.preferredStatusBarUpdateAnimation()
        } else {
            return .None
        }
    }
    
    internal override func shouldAutorotate() -> Bool {
        if let rootViewController = UIApplication.sharedApplication().delegate?.window??.rootViewController {
            return rootViewController.shouldAutorotate()
        } else {
            return false
        }
    }
    #endif
}
