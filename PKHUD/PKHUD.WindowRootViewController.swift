//
//  PKHUD.WindowRootViewController.swift
//  PKHUD
//
//  Created by Philip Kluz on 6/18/14.
//  Copyright (c) 2014 NSExceptional. All rights reserved.
//

import UIKit

extension PKHUD {
    
    class WindowRootViewController: UIViewController {
        
        override func supportedInterfaceOrientations() -> Int {
            return UIApplication.sharedApplication().delegate.window!.rootViewController.supportedInterfaceOrientations()
        }
        
        override func preferredStatusBarStyle() -> UIStatusBarStyle {
            return UIApplication.sharedApplication().delegate.window!.rootViewController.preferredStatusBarStyle()
        }
        
        override func prefersStatusBarHidden() -> Bool {
            return UIApplication.sharedApplication().delegate.window!.rootViewController.prefersStatusBarHidden()
        }
        
        override func preferredStatusBarUpdateAnimation() -> UIStatusBarAnimation {
            return UIApplication.sharedApplication().delegate.window!.rootViewController.preferredStatusBarUpdateAnimation()
        }
        
        override func shouldAutorotate() -> Bool {
            return UIApplication.sharedApplication().delegate.window!.rootViewController.shouldAutorotate()
        }
    }
}
