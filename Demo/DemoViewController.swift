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
        PKHUD.Controller.sharedController.dimsBackground = false
        PKHUD.Controller.sharedController.userInteractionOnUnderlyingViewsEnabled = false
    }
    
    @IBAction func showStatusHUD(sender: AnyObject) {
        PKHUD.Controller.sharedController.contentView = PKHUD.ContentView.StatusView(title: "Ringer", subtitle: "Silent", image: PKHUD.Assets.ringerMutedImage)
        PKHUD.Controller.sharedController.showHUD()
        PKHUD.Controller.sharedController.hideHUD(afterDelay: 2.0)
    }
    
    @IBAction func showProgressHUD(sender: AnyObject) {
        PKHUD.Controller.sharedController.contentView = PKHUD.ContentView.ProgressView()
        PKHUD.Controller.sharedController.showHUD()
        PKHUD.Controller.sharedController.hideHUD(afterDelay: 2.0)
    }
    
    @IBAction func showTitleHUD(sender: AnyObject) {
        PKHUD.Controller.sharedController.contentView = PKHUD.ContentView.TitleView(title: "Success", image: PKHUD.Assets.checkmarkImage)
        PKHUD.Controller.sharedController.showHUD()
        PKHUD.Controller.sharedController.hideHUD(afterDelay: 2.0)
    }
    
    @IBAction func showSubtitleHUD(sender: AnyObject) {
        PKHUD.Controller.sharedController.contentView = PKHUD.ContentView.SubtitleView(subtitle: "Error", image: PKHUD.Assets.crossImage)
        PKHUD.Controller.sharedController.showHUD()
        PKHUD.Controller.sharedController.hideHUD(afterDelay: 2.0)
    }
    
    @IBAction func showTextHUD(sender: AnyObject) {
        PKHUD.Controller.sharedController.contentView = PKHUD.ContentView.TextView(text: "Requesting Licence…")
        PKHUD.Controller.sharedController.showHUD()
        PKHUD.Controller.sharedController.hideHUD(afterDelay: 2.0)
    }
    
    @IBAction func showAlertWithHUD(sender: AnyObject) {
        let alert = UIAlertController(title: "An Alert", message: "With an Extraordinary Message", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(0.25 * Double(NSEC_PER_SEC))), dispatch_get_main_queue()) {
            self.showTitleHUD(sender)
        }
    }
    
    override func supportedInterfaceOrientations() -> Int
    {
        return Int(UIInterfaceOrientationMask.AllButUpsideDown.toRaw())
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
}
