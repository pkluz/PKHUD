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
    
    private let rootViewController = UIApplication.sharedApplication().delegate.window!?.rootViewController
    
    internal override func supportedInterfaceOrientations() -> Int {
        return rootViewController!.supportedInterfaceOrientations()
    }
    
    internal override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return rootViewController!.preferredStatusBarStyle()
    }
    
    internal override func prefersStatusBarHidden() -> Bool {
        return rootViewController!.prefersStatusBarHidden()
    }
    
    internal override func preferredStatusBarUpdateAnimation() -> UIStatusBarAnimation {
        return rootViewController!.preferredStatusBarUpdateAnimation()
    }
    
    internal override func shouldAutorotate() -> Bool {
        return rootViewController!.shouldAutorotate()
    }
}
