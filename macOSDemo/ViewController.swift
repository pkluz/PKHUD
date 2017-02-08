//
//  ViewController.swift
//  PKHUD OSX Demo
//
//  Created by Fabian Renner on 22.06.16.
//  Copyright © 2016 NSExceptional. All rights reserved.
//

import Cocoa
import PKHUDMACOS

class ViewController: NSViewController {
    //pure without title and subtitle
    
    @IBAction func showSuccessHUD(sender: AnyObject) {
        HUD.flash(.success, delay: 2.0)
    }

    @IBAction func showErrorHUD(sender: AnyObject) {
        HUD.flash(.error, delay: 2.0)
    }
    
    @IBAction func showProgressHUD(sender: AnyObject) {
        HUD.flash(.progress, delay: 2.0)
    }
    
    @IBAction func showImageHUD(sender: AnyObject) {
        HUD.flash(.image(PKHUDAssets.checkmarkImage), delay: 2.0)
    }
    
    @IBAction func showRotatingImageHUD(sender: AnyObject) {
        HUD.flash(.rotatingImage(PKHUDAssets.checkmarkImage), delay: 2.0)
    }
    
    
    //with title and subtitle
    
    @IBAction func showLabeledSuccessHUD(sender: AnyObject) {
        HUD.flash(.labeledSuccess(title: "Title", subtitle: "Subtitle"), delay: 2.0)
    }
    
    @IBAction func showLabeledErrorHUD(sender: AnyObject) {
        HUD.flash(.labeledError(title: "Title", subtitle: "Subtitle"), delay: 2.0)
    }
    
    @IBAction func showLabeledProgressHUD(sender: AnyObject) {
        HUD.flash(.labeledProgress(title: "Title", subtitle: "Subtitle"), delay: 2.0)
    }
    
    @IBAction func showLabeledImageHUD(sender: AnyObject) {
        HUD.flash(.labeledImage(image: PKHUDAssets.checkmarkImage, title: "Title", subtitle: "Subtitle"), delay: 2.0)
    }
    
    @IBAction func showLabeledRotatingImageHUD(sender: AnyObject) {
        HUD.flash(.labeledRotatingImage(image: PKHUDAssets.checkmarkImage, title: "Title", subtitle: "Subtitle"), delay: 2.0)
    }
    
    
    //other
    
    @IBAction func showLabelHUD(sender: AnyObject) {
        HUD.flash(.label("Label"), delay: 2.0)
    }
    
    @IBAction func showSystemActivityHUD(sender: AnyObject) {
        HUD.flash(.systemActivity, delay: 2.0)
    }
    
    
    //mixed
    
    @IBAction func showProgressThenSuccessHUD(sender: AnyObject) {
        HUD.show(.progress)
        
        // Now some long running task starts...
        delay(delay: 2.0) {
            // ...and once it finishes we flash the HUD for a second.
            HUD.flash(.success, delay: 1.0)
        }
    }
    
    @IBAction func showTextWithCompletionHUD(sender: AnyObject) {
        HUD.flash(.label("Requesting Licence…"), delay: 2.0) { _ in
            print("License Obtained.")
        }
    }
    
    
    
    func delay(delay:Double, closure:@escaping ()->()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + delay, execute: closure)
    }
}

