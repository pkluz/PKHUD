//
//  HUD.swift
//  PKHUD
//
//  Created by Philip Kluz on 6/13/14.
//  Copyright (c) 2014 NSExceptional. All rights reserved.
//

import UIKit

/**
  HUDController controls showing and hiding of the HUD, as well as its contents and touch response behavior.
  It is recommended to use the PKHUD.Controller.sharedController instance, nevertheless you are free to instantiate your own.
*/
@objc public class HUDController {
    private struct Constants {
        static let sharedController = HUDController()
    }
    
    private let window = Window()
    
    public class var sharedController: HUDController {
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
    
    public func show() {
        window.showFrameView()
        if dimsBackground {
            window.showBackground(animated: true)
        }
    }
    
    public func hide(animated anim: Bool = true) {
        window.hideFrameView(animated: anim)
        if dimsBackground {
            window.hideBackground(animated: true)
        }
    }
    
    private var hideTimer: NSTimer?
    public func hide(afterDelay delay: NSTimeInterval) {
        hideTimer?.invalidate()
        hideTimer = NSTimer.scheduledTimerWithTimeInterval(delay, target: self, selector: Selector("hideAnimated"), userInfo: nil, repeats: false)
    }
    
    // MARK: Helper
    
    internal func hideAnimated() -> Void {
        hide(animated: true)
    }
}
