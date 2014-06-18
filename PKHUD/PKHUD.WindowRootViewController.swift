//
//  PKHUD.WindowRootViewController.swift
//  PKHUD
//
//  Created by Philip Kluz on 6/18/14.
//  Copyright (c) 2014 NSExceptional. All rights reserved.
//

import UIKit

extension PKHUD {
    
    /// Serves as a configuration relay controller, tapping into the main window's rootViewController settings.
    class WindowRootViewController: UIViewController {
        
        let rootViewController = UIApplication.sharedApplication().delegate.window!.rootViewController
        
        override func supportedInterfaceOrientations() -> Int {
            return rootViewController.supportedInterfaceOrientations()
        }
        
        override func preferredStatusBarStyle() -> UIStatusBarStyle {
            return rootViewController.preferredStatusBarStyle()
        }
        
        override func prefersStatusBarHidden() -> Bool {
            return rootViewController.prefersStatusBarHidden()
        }
        
        override func preferredStatusBarUpdateAnimation() -> UIStatusBarAnimation {
            return rootViewController.preferredStatusBarUpdateAnimation()
        }
        
        override func shouldAutorotate() -> Bool {
            return rootViewController.shouldAutorotate()
        }
    }
}
