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
open class PKHUD: NSObject {

    fileprivate struct Constants {
        static let sharedHUD = PKHUD()
    }

    public var viewToPresentOn: UIView?

    fileprivate let container = ContainerView()
    fileprivate var hideTimer: Timer?

    public typealias TimerAction = (Bool) -> Void
    fileprivate var timerActions = [String: TimerAction]()

    /// Grace period is the time (in seconds) that the invoked method may be run without
    /// showing the HUD. If the task finishes before the grace time runs out, the HUD will
    /// not be shown at all.
    /// This may be used to prevent HUD display for very short tasks.
    /// Defaults to 0 (no grace time).
    @available(*, deprecated, message: "Will be removed with Swift4 support, use gracePeriod instead")
    public var graceTime: TimeInterval {
        get {
            return gracePeriod
        }
        set(newPeriod) {
            gracePeriod = newPeriod
        }
    }

    /// Grace period is the time (in seconds) that the invoked method may be run without
    /// showing the HUD. If the task finishes before the grace time runs out, the HUD will
    /// not be shown at all.
    /// This may be used to prevent HUD display for very short tasks.
    /// Defaults to 0 (no grace time).
    public var gracePeriod: TimeInterval = 0
    fileprivate var graceTimer: Timer?

    // MARK: Public

    open class var sharedHUD: PKHUD {
        return Constants.sharedHUD
    }

    public override init () {
        super.init()
        NotificationCenter.default.addObserver(self,
            selector: #selector(PKHUD.willEnterForeground(_:)),
            name: NSNotification.Name.UIApplicationWillEnterForeground,
            object: nil)
        userInteractionOnUnderlyingViewsEnabled = false
        container.frameView.autoresizingMask = [ .flexibleLeftMargin,
                                                 .flexibleRightMargin,
                                                 .flexibleTopMargin,
                                                 .flexibleBottomMargin ]

        self.container.isAccessibilityElement = true
        self.container.accessibilityIdentifier = "PKHUD"
    }

    public convenience init(viewToPresentOn view: UIView) {
        self.init()
        viewToPresentOn = view
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    open var dimsBackground = true
    open var userInteractionOnUnderlyingViewsEnabled: Bool {
        get {
            return !container.isUserInteractionEnabled
        }
        set {
            container.isUserInteractionEnabled = !newValue
        }
    }

    open var isVisible: Bool {
        return !container.isHidden
    }

    open var contentView: UIView {
        get {
            return container.frameView.content
        }
        set {
            container.frameView.content = newValue
            startAnimatingContentView()
        }
    }

    open var effect: UIVisualEffect? {
        get {
            return container.frameView.effect
        }
        set {
            container.frameView.effect = newValue
        }
    }

    open func show(onView view: UIView? = nil) {
        let view: UIView = view ?? viewToPresentOn ?? UIApplication.shared.keyWindow!
        if  !view.subviews.contains(container) {
            view.addSubview(container)
            container.frame.origin = CGPoint.zero
            container.frame.size = view.frame.size
            container.autoresizingMask = [ .flexibleHeight, .flexibleWidth ]
            container.isHidden = true
        }
        if dimsBackground {
            container.showBackground(animated: true)
        }

        // If the grace time is set, postpone the HUD display
        if gracePeriod > 0.0 {
            let timer = Timer(timeInterval: gracePeriod, target: self, selector: #selector(PKHUD.handleGraceTimer(_:)), userInfo: nil, repeats: false)
            RunLoop.current.add(timer, forMode: .commonModes)
            graceTimer = timer
        } else {
            showContent()
        }
    }

    func showContent() {
        graceTimer?.invalidate()
        container.showFrameView()
        startAnimatingContentView()
    }

    open func hide(animated anim: Bool = true, completion: TimerAction? = nil) {
        graceTimer?.invalidate()

        container.hideFrameView(animated: anim, completion: completion)
        stopAnimatingContentView()
    }

    open func hide(_ animated: Bool, completion: TimerAction? = nil) {
        hide(animated: animated, completion: completion)
    }

    open func hide(afterDelay delay: TimeInterval, completion: TimerAction? = nil) {
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

    @objc internal func willEnterForeground(_ notification: Notification?) {
        self.startAnimatingContentView()
    }

    internal func startAnimatingContentView() {
        if let animatingContentView = contentView as? PKHUDAnimating, isVisible {
            animatingContentView.startAnimation()
        }
    }

    internal func stopAnimatingContentView() {
        if let animatingContentView = contentView as? PKHUDAnimating {
            animatingContentView.stopAnimation?()
        }
    }

    // MARK: Timer callbacks

    @objc internal func performDelayedHide(_ timer: Timer? = nil) {
        let userInfo = timer?.userInfo as? [String:AnyObject]
        let key = userInfo?["timerActionKey"] as? String
        var completion: TimerAction?

        if let key = key, let action = timerActions[key] {
            completion = action
            timerActions[key] = nil
        }

        hide(animated: true, completion: completion)
    }

    @objc internal func handleGraceTimer(_ timer: Timer? = nil) {
        // Show the HUD only if the task is still running
        if (graceTimer?.isValid)! {
            showContent()
        }
    }
}
