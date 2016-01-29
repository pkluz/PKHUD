//
//  DemoViewController.swift
//  PKHUD Demo
//
//  Created by Philip Kluz on 6/18/14.
//  Copyright (c) 2014 NSExceptional. All rights reserved.
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
        HUD.flash(.Failure, withDelay: 2.0)
    }
    
    @IBAction func showAnimatedProgressHUD(sender: AnyObject) {
        HUD.show(.Progress)
     
        delay(2.0) {
            HUD.flash(.Success, withDelay: 2.0)
        }
    }
    
    @IBAction func showAnimatedStatusProgressHUD(sender: AnyObject) {
        HUD.flash(.StatusProgress(title: "Title", subtitle: "Subtitle goes here"), withDelay: 2.0)
        delay(2.0) {
            HUD.flash(.Success)
        }
    }

    @IBAction func showTextHUD(sender: AnyObject) {
        HUD.flash(.Text("Requesting Licence…"), withDelay: 2.0)
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
