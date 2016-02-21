//
//  DemoViewController.swift
//  PKHUD Demo
//
//  Created by Philip Kluz on 6/18/14.
//  Copyright (c) 2016 NSExceptional. All rights reserved.
//

import UIKit
import PKHUD

class DemoViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        HUD.dimsBackground = false
        HUD.allowsInteraction = false
    }

    @IBAction func showAnimatedSuccessHUD(sender: AnyObject) {
        HUD.flash(.Success, withDelay: 2.0)
    }
    
    @IBAction func showAnimatedErrorHUD(sender: AnyObject) {
        HUD.show(.Error)
        HUD.hide(afterDelay: 2.0)
    }
    
    @IBAction func showAnimatedProgressHUD(sender: AnyObject) {
        HUD.show(.Progress)
        
        // Now some long running task starts...
        delay(2.0) {
            // ...and once it finishes we flash the HUD for a second.
            HUD.flash(.Success, withDelay: 1.0)
        }
    }
    
    @IBAction func showCustomProgressHUD(sender: AnyObject) {
        HUD.flash(.RotatingImage(UIImage(named: "progress")), withDelay: 2.0)
    }
    
    @IBAction func showAnimatedStatusProgressHUD(sender: AnyObject) {
        HUD.flash(.LabeledProgress(title: "Title", subtitle: "Subtitle"), withDelay: 2.0)
    }

    @IBAction func showTextHUD(sender: AnyObject) {
        HUD.flash(.Label("Requesting Licence…"), withDelay: 2.0)
    }
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.AllButUpsideDown;
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
    
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }
}
