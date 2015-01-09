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
        HUDController.sharedController.dimsBackground = false
        HUDController.sharedController.userInteractionOnUnderlyingViewsEnabled = false
    }
    
    @IBAction func showStatusHUD(sender: AnyObject) {
        HUDController.sharedController.contentView = HUDContentView.StatusView(title: "Ringer", subtitle: "Silent", image: HUDAssets.ringerMutedImage)
        HUDController.sharedController.show()
        HUDController.sharedController.hide(afterDelay: 2.0)
    }
    
    @IBAction func showProgressHUD(sender: AnyObject) {
        HUDController.sharedController.contentView = HUDContentView.ProgressView()
        HUDController.sharedController.show()
        HUDController.sharedController.hide(afterDelay: 2.0)
    }
    
    @IBAction func showAppleProgressHUD(sender: AnyObject) {
        HUDController.sharedController.contentView = HUDContentView.SystemActivityIndicatorView()
        HUDController.sharedController.show()
        HUDController.sharedController.hide(afterDelay: 2.0)
    }
    
    @IBAction func showTitleHUD(sender: AnyObject) {
        HUDController.sharedController.contentView = HUDContentView.TitleView(title: "Success", image: HUDAssets.checkmarkImage)
        HUDController.sharedController.show()
        HUDController.sharedController.hide(afterDelay: 2.0)
    }
    
    @IBAction func showSubtitleHUD(sender: AnyObject) {
        HUDController.sharedController.contentView = HUDContentView.SubtitleView(subtitle: "Error", image: HUDAssets.crossImage)
        HUDController.sharedController.show()
        HUDController.sharedController.hide(afterDelay: 2.0)
    }
    
    @IBAction func showTextHUD(sender: AnyObject) {
        HUDController.sharedController.contentView = HUDContentView.TextView(text: "Requesting Licence…")
        HUDController.sharedController.show()
        HUDController.sharedController.hide(afterDelay: 2.0)
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
