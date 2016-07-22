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
    private var hideTimer: Timer?
    
    public typealias TimerAction = (Bool) -> Void
    private var timerActions = [String: TimerAction]()
    
    // MARK: Public
    
    public class var sharedHUD: PKHUD {
        return Constants.sharedHUD
    }
    
    public override init () {
        super.init()
        NotificationCenter.default.addObserver(self,
            selector: #selector(PKHUD.willEnterForeground(_:)),
            name: NSNotification.Name.UIApplicationWillEnterForeground,
            object: nil)
        userInteractionOnUnderlyingViewsEnabled = false
        window.frameView.autoresizingMask = [ .flexibleLeftMargin,
                                              .flexibleRightMargin,
                                              .flexibleTopMargin,
                                              .flexibleBottomMargin ]
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    public var dimsBackground = true
    public var userInteractionOnUnderlyingViewsEnabled: Bool {
        get {
            return !window.isUserInteractionEnabled
        }
        set {
            window.isUserInteractionEnabled = !newValue
        }
    }
    
    public var isVisible: Bool {
        return !window.isHidden
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
    
    public func hide(_ animated: Bool, completion: TimerAction? = nil) {
        hide(animated: animated, completion: completion)
    }
    
    public func hide(afterDelay delay: TimeInterval, completion: TimerAction? = nil) {
        let key = UUID().uuidString
        let userInfo = ["timerActionKey": key]
        if let completion = completion {
            timerActions[key] = completion
        }
        
        hideTimer?.invalidate()
        hideTimer = Timer.scheduledTimer(timeInterval: delay,
                                                           target: self,
                                                           selector: #selector(PKHUD.performDelayedHide(_:)),
                                                           userInfo: userInfo,
                                                           repeats: false)
    }
    
    // MARK: Internal
    
    internal func willEnterForeground(_ notification: Notification?) {
        self.startAnimatingContentView()
    }
    
    internal func performDelayedHide(_ timer: Timer? = nil) {
        let key = timer?.userInfo?["timerActionKey"] as? String
        var completion: TimerAction?
        
        if let key = key, let action = timerActions[key] {
            completion = action
            timerActions[key] = nil
        }
        
        hide(animated: true, completion: completion);
    }
    
    internal func startAnimatingContentView() {
        if isVisible && contentView.conforms(to: PKHUDAnimating.self) {
            let animatingContentView = contentView as! PKHUDAnimating
            animatingContentView.startAnimation()
        }
    }
    
    internal func stopAnimatingContentView() {
        if contentView.conforms(to: PKHUDAnimating.self) {
            let animatingContentView = contentView as! PKHUDAnimating
            animatingContentView.stopAnimation?()
        }
    }
}
