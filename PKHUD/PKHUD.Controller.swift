//
//  HUD.swift
//  PKHUD
//
//  Created by Philip Kluz on 6/13/14.
//  Copyright (c) 2014 NSExceptional. All rights reserved.
//

import UIKit

/**
    Structure encapsulating all SwiftHUD classes.
*/
struct PKHUD {
    
    /**
      PKHUD.Controller controls showing and hiding of the HUD, as well as its contents and touch response behavior.
      It is recommended to use the PKHUD.Controller.sharedController instance, nevertheless you are free to instantiate your own.
    */
    @objc class Controller {
        
        struct Constants {
            static let sharedWindow: PKHUD.Window?
            static let sharedController = Controller.init()
        }
        
        let window = PKHUD.Window()
        
        class var sharedController: Controller {
            return Constants.sharedController
        }
        
        init () {
            userInteractionOnUnderlyingViewsEnabled = false
            window.frameView.autoresizingMask = .FlexibleLeftMargin | .FlexibleRightMargin | .FlexibleTopMargin | .FlexibleBottomMargin
        }
        
        var dimsBackground = true
        
        var userInteractionOnUnderlyingViewsEnabled: Bool {
            get {
                return !window.userInteractionEnabled
            }
            set (newValue) {
                window.userInteractionEnabled = !newValue
            }
        }
        
        var contentView: UIView {
            get {
                return window.frameView.content
            }
            set(newValue) {
                window.frameView.content = newValue
            }
        }
        
        func showHUD() {
            window.showFrameView()
            if dimsBackground {
                window.showBackground(animated: true)
            }
        }
        
        func hideHUD(animated anim: Bool = true) {
            window.hideFrameView(animated: anim)
            if dimsBackground {
                window.hideBackground(animated: true)
            }
        }
        
        var hideTimer: NSTimer?
        func hideHUD(afterDelay delay: NSTimeInterval) {
            hideTimer?.invalidate()
            hideTimer = NSTimer.scheduledTimerWithTimeInterval(delay, target: self, selector: Selector("hideHUDAnimated"), userInfo: nil, repeats: false)
        }
        
        // MARK: Helper
        
        func hideHUDAnimated() -> Void {
            hideHUD(animated: true)
        }
    }
}
