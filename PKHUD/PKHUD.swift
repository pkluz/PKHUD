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
    
    private let containerView = ContainerView()
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
            selector: #selector(PKHUD.willEnterForeground(_:)),
            name: UIApplicationWillEnterForegroundNotification,
            object: nil)
        userInteractionOnUnderlyingViewsEnabled = false
    }
    
    public var dimsBackground = true
    public var userInteractionOnUnderlyingViewsEnabled: Bool {
        get {
            return !containerView.userInteractionEnabled
        }
        set {
            containerView.userInteractionEnabled = !newValue
        }
    }
    
    public var isVisible: Bool {
        return !containerView.hidden
    }
    
    public var contentView: UIView {
        get {
            return containerView.frameView.content
        }
        set {
            containerView.frameView.content = newValue
            startAnimatingContentView()
        }
    }
    
    public var effect: UIVisualEffect? {
        get {
            return containerView.frameView.effect
        }
        set {
            containerView.frameView.effect = effect
        }
    }
    
    public func show(onView view: UIView? = nil) {
        guard let view = view ?? UIApplication.sharedApplication().keyWindow else {
            return
        }
        if self.containerView.superview == nil {
            view.insertSubview(self.containerView, atIndex: 9999)
            containerView.leftAnchor.constraintEqualToAnchor(view.leftAnchor).active = true
            containerView.topAnchor.constraintEqualToAnchor(view.topAnchor).active = true
            containerView.rightAnchor.constraintEqualToAnchor(view.rightAnchor).active = true
            containerView.bottomAnchor.constraintEqualToAnchor(view.bottomAnchor).active = true
        }
        containerView.showFrameView()
        if dimsBackground {
            containerView.showBackground(animated: true)
        }
        
        startAnimatingContentView()
    }
    
    public func hide(animated anim: Bool = true, completion: TimerAction? = nil) {
        containerView.hideFrameView(animated: anim, completion: completion)
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
                                                           selector: #selector(PKHUD.performDelayedHide(_:)),
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
        if let animatingContentView = contentView as? PKHUDAnimating where isVisible {
            animatingContentView.startAnimation()
        }
    }
    
    internal func stopAnimatingContentView() {
        if let animatingContentView = contentView as? PKHUDAnimating {
            animatingContentView.stopAnimation?()
        }
    }
}
