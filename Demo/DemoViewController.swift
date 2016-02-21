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
        PKHUD.sharedHUD.dimsBackground = false
        PKHUD.sharedHUD.userInteractionOnUnderlyingViewsEnabled = false
    }

    @IBAction func showAnimatedSuccessHUD(sender: AnyObject) {
        PKHUD.sharedHUD.contentView = PKHUDSuccessView()
        PKHUD.sharedHUD.show()
        PKHUD.sharedHUD.hide(afterDelay: 2.0)
    }
    
    @IBAction func showAnimatedErrorHUD(sender: AnyObject) {
        PKHUD.sharedHUD.contentView = PKHUDErrorView()
        PKHUD.sharedHUD.show()
        PKHUD.sharedHUD.hide(afterDelay: 2.0)
    }
    
    @IBAction func showAnimatedProgressHUD(sender: AnyObject) {
        PKHUD.sharedHUD.contentView = PKHUDProgressView()
        PKHUD.sharedHUD.show()
        PKHUD.sharedHUD.hide(afterDelay: 2.0) { finished in
            PKHUD.sharedHUD.contentView = PKHUDSuccessView()
        }
    }
    
    @IBAction func showCustomProgressHUD(sender: AnyObject) {
        PKHUD.sharedHUD.contentView = PKHUDCustomProgressView(image: UIImage(named: "progress"))
        PKHUD.sharedHUD.show()
        
        let delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(2.0 * Double(NSEC_PER_SEC)))
        dispatch_after(delayTime, dispatch_get_main_queue()) {
            PKHUD.sharedHUD.contentView = PKHUDSuccessView()
            PKHUD.sharedHUD.hide(afterDelay: 2.0)
        }
    }
    
    @IBAction func showAnimatedStatusProgressHUD(sender: AnyObject) {
        PKHUD.sharedHUD.contentView = PKHUDStatusProgressView(title: "Title", subtitle: "Subtitle goes here")
        PKHUD.sharedHUD.show()
        PKHUD.sharedHUD.hide(afterDelay: 2.0) { finished in
            PKHUD.sharedHUD.contentView = PKHUDSuccessView()
        }
    }

    @IBAction func showTextHUD(sender: AnyObject) {
        PKHUD.sharedHUD.contentView = PKHUDTextView(text: "Requesting Licence…")
        PKHUD.sharedHUD.show()
        PKHUD.sharedHUD.hide(afterDelay: 2.0)
    }
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.AllButUpsideDown;
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
}
