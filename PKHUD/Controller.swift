//
//  HUD.swift
//  PKHUD
//
//  Created by Philip Kluz on 6/13/14.
//  Copyright (c) 2014 NSExceptional. All rights reserved.
//

import UIKit

/**
  PKHUD.Controller controls showing and hiding of the HUD, as well as its contents and touch response behavior.
  It is recommended to use the PKHUD.Controller.sharedController instance, nevertheless you are free to instantiate your own.
*/
@objc public class Controller {
    
    private struct Constants {
        static let sharedController = Controller()
    }
    
    private let window = Window()
    
    public class var sharedController: Controller {
        return Constants.sharedController
    }
    
    public init () {
        userInteractionOnUnderlyingViewsEnabled = false
        window.frameView.autoresizingMask = .FlexibleLeftMargin | .FlexibleRightMargin | .FlexibleTopMargin | .FlexibleBottomMargin
    }
    
    public var dimsBackground = true
    
    public var userInteractionOnUnderlyingViewsEnabled: Bool {
        get {
            return !window.userInteractionEnabled
        }
        set {
            window.userInteractionEnabled = !newValue
        }
    }
    
    public var contentView: UIView {
        get {
            return window.frameView.content
        }
        set {
        window.frameView.content = newValue
        }
    }
    
    public func showHUD() {
        window.showFrameView()
        if dimsBackground {
            window.showBackground(animated: true)
        }
    }
    
    public func hideHUD(animated anim: Bool = true) {
        window.hideFrameView(animated: anim)
        if dimsBackground {
            window.hideBackground(animated: true)
        }
    }
    
    private var hideTimer: NSTimer?
    public func hideHUD(afterDelay delay: NSTimeInterval) {
        hideTimer?.invalidate()
        hideTimer = NSTimer.scheduledTimerWithTimeInterval(delay, target: self, selector: Selector("hideHUDAnimated"), userInfo: nil, repeats: false)
    }
    
    // MARK: Helper
    
    internal func hideHUDAnimated() -> Void {
        hideHUD(animated: true)
    }
}
