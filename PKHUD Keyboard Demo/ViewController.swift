//
//  ViewController.swift
//  Keyboard Demo
//
//  Created by Mendy Krinsky on 7/2/17.
//  Copyright © 2017 NSExceptional. All rights reserved.
//

import UIKit
import PKHUD

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        HUD.dimsBackground = false
        HUD.allowsInteraction = true
    }
    @IBAction func hideKeyboard(_ sender: Any) {
        self.view.endEditing(true)
    }
    
    @IBAction func showRandomHUD(_ sender: Any) {
        let rand = arc4random() % 5
        switch rand {
        case 0:
            showHudWithType(.success)
        case 1:
            showHudWithType(.error)
        case 2:
            showHudWithType(.label("Label"))
        case 3:
            showHudWithType(.systemActivity)
        case 4:
            showHudWithType(.labeledSuccess(title: "Success", subtitle: "Subtitle"))
        default:
            break
        }
    }
    
    func showHudWithType(_ type: HUDContentType) {
        HUD.flash(type, delay: 2.0)
    }
}

