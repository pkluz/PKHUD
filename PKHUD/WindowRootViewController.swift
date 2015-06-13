//
//  PKHUD.WindowRootViewController.swift
//  PKHUD
//
//  Created by Philip Kluz on 6/18/14.
//  Copyright (c) 2014 NSExceptional. All rights reserved.
//

import UIKit

/// Serves as a configuration relay controller, tapping into the main window's rootViewController settings.
internal class WindowRootViewController: UIViewController {
    
    internal override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        if let rootViewController = UIApplication.sharedApplication().delegate?.window??.rootViewController {
            return rootViewController.supportedInterfaceOrientations()
        } else {
            return UIInterfaceOrientationMask.Portrait
        }
    }
    
    internal override func preferredStatusBarStyle() -> UIStatusBarStyle {
        if let rootViewController = UIApplication.sharedApplication().delegate?.window??.rootViewController {
            return rootViewController.preferredStatusBarStyle()
        } else {
            return .Default
        }
    }
    
    internal override func prefersStatusBarHidden() -> Bool {
        if let rootViewController = UIApplication.sharedApplication().delegate?.window??.rootViewController {
            return rootViewController.prefersStatusBarHidden()
        } else {
            return false
        }
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
}
