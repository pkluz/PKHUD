//
//  DemoViewController.swift
//  PKHUD Demo
//
//  Created by Philip Kluz on 6/18/14.
//  Copyright (c) 2014 NSExceptional. All rights reserved.
//

import UIKit
import PKHUD

@objc
class DemoViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        PKHUD.sharedHUD.dimsBackground = false
        PKHUD.sharedHUD.userInteractionOnUnderlyingViewsEnabled = false
    }
    
    @IBAction func showStatusHUD(sender: AnyObject) {
        PKHUD.sharedHUD.contentView = PKHUDStatusView(title: "Success", subtitle: "Subtitle", image: PKHUDAssets.checkmarkImage)
        PKHUD.sharedHUD.show()
        PKHUD.sharedHUD.hide(afterDelay: 2.0)
    }
    
    @IBAction func showProgressHUD(sender: AnyObject) {
        PKHUD.sharedHUD.contentView = PKHUDProgressView()
        PKHUD.sharedHUD.show()
        PKHUD.sharedHUD.hide(afterDelay: 2.0)
    }
    
    @IBAction func showAppleProgressHUD(sender: AnyObject) {
        PKHUD.sharedHUD.contentView = PKHUDSystemActivityIndicatorView()
        PKHUD.sharedHUD.show()
        PKHUD.sharedHUD.hide(afterDelay: 2.0)
    }
    
    @IBAction func showTitleHUD(sender: AnyObject) {
        PKHUD.sharedHUD.contentView = PKHUDTitleView(title: "Success", image: PKHUDAssets.checkmarkImage)
        PKHUD.sharedHUD.show()
        PKHUD.sharedHUD.hide(afterDelay: 2.0)
    }
    
    @IBAction func showSubtitleHUD(sender: AnyObject) {
        PKHUD.sharedHUD.contentView = PKHUDSubtitleView(subtitle: "Error", image: PKHUDAssets.crossImage)
        PKHUD.sharedHUD.show()
        PKHUD.sharedHUD.hide(afterDelay: 2.0)
    }
    
    @IBAction func showTextHUD(sender: AnyObject) {
        PKHUD.sharedHUD.contentView = PKHUDTextView(text: "Requesting Licence…")
        PKHUD.sharedHUD.show()
        PKHUD.sharedHUD.hide(afterDelay: 2.0)
    }
    
    @IBAction func showAlertWithHUD(sender: AnyObject) {
        let alert = UIAlertController(title: "An Alert", message: "With an Extraordinary Message", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(0.25 * Double(NSEC_PER_SEC))), dispatch_get_main_queue()) {
            self.showTitleHUD(sender)
        }
    }
    
    override func supportedInterfaceOrientations() -> Int {
        return Int(UIInterfaceOrientationMask.AllButUpsideDown.rawValue)
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
}
