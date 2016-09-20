//
//  ViewController.swift
//  PKHUD tvDEMO
//
//  Created by Mario Esposito on 9/19/16.
//  Copyright © 2016 NSExceptional. All rights reserved.
//

import UIKit
import PKHUDtvOS

class ViewController: UIViewController {

    @IBAction func showHUD(sender: AnyObject) {
        HUD.show(.RotatingImage(UIImage(named: "spin")))
        HUD.hide(afterDelay: 2.0)
    }
    
    @IBAction func detailsShow(sender: AnyObject) {
        HUD.show(.LabeledSuccess(title: "Awesome", subtitle: "You are"))
        HUD.hide(afterDelay: 2.0)
    }
    
    @IBAction func dimShow(sender: AnyObject) {
        HUD.allowsInteraction = false
        HUD.dimsBackground = true
        HUD.show(.LabeledProgress(title: "Life is good", subtitle: "Thanks to PKHUD"))
        HUD.hide(afterDelay: 2.0)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
}

