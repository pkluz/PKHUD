//
//  HUD.swift
//  PKHUD
//
//  Created by Philip Kluz on 6/13/14.
//  Copyright (c) 2016 NSExceptional. All rights reserved.
//  Licensed under the MIT license.
//

import UIKit

/// The PKHUD object controls showing and hiding of the HUD, as well as its contents and touch response behavior.
public class PKHUD: NSObject {
    
    private struct Constants {
        static let sharedHUD = PKHUD()
    }
    
    private let window = Window()
    private var hideTimer: NSTimer?
    
    public typealias TimerAction = Bool -> Void
    private var timerActions = [String: TimerAction]()
    
    // MARK: Public
    
    public class var sharedHUD: PKHUD {
        return Constants.sharedHUD
    }
    
    public override init () {
        super.init()
        NSNotificationCenter.defaultCenter().addObserver(self,
            selector: Selector("willEnterForeground:"),
            name: UIApplicationWillEnterForegroundNotification,
            object: nil)
        userInteractionOnUnderlyingViewsEnabled = false
        window.frameView.autoresizingMask = [ .FlexibleLeftMargin,
                                              .FlexibleRightMargin,
                                              .FlexibleTopMargin,
                                              .FlexibleBottomMargin ]
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
    
    public var isVisible: Bool {
        return !window.hidden
    }
    
    public var contentView: UIView {
        get {
            return window.frameView.content
        }
        set {
            window.frameView.content = newValue
            startAnimatingContentView()
        }
    }
    
    public var effect: UIVisualEffect? {
        get {
            return window.frameView.effect
        }
        set {
            window.frameView.effect = effect
        }
    }
    
    public func show() {
        window.showFrameView()
        if dimsBackground {
            window.showBackground(animated: true)
        }
        
        startAnimatingContentView()
    }
    
    public func hide(animated anim: Bool = true, completion: TimerAction? = nil) {
        window.hideFrameView(animated: anim, completion: completion)
        stopAnimatingContentView()
    }
    
    public func hide(afterDelay delay: NSTimeInterval = 1.0, completion: TimerAction? = nil) {
        let key = NSUUID().UUIDString
        let userInfo = ["timerActionKey": key]
        if let completion = completion {
            timerActions[key] = completion
        }
        
        hideTimer?.invalidate()
        hideTimer = NSTimer.scheduledTimerWithTimeInterval(delay,
                                                           target: self,
                                                           selector: Selector("performDelayedHide:"),
                                                           userInfo: userInfo,
                                                           repeats: false)
    }
    
    // MARK: Internal
    
    internal func willEnterForeground(notification: NSNotification?) {
        self.startAnimatingContentView()
    }
    
    internal func performDelayedHide(timer: NSTimer? = nil) {
        let key = timer?.userInfo?["timerActionKey"] as? String
        var completion: TimerAction?
        
        if let key = key, let action = timerActions[key] {
            completion = action
        }
        
        hide(animated: true, completion: completion);
    }
    
    internal func startAnimatingContentView() {
        if isVisible && contentView.conformsToProtocol(PKHUDAnimating) {
            let animatingContentView = contentView as! PKHUDAnimating
            animatingContentView.startAnimation()
        }
    }
    
    internal func stopAnimatingContentView() {
        if contentView.conformsToProtocol(PKHUDAnimating) {
            let animatingContentView = contentView as! PKHUDAnimating
            animatingContentView.stopAnimation?()
        }
    }
}
