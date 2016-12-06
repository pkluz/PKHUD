//
//  HUD.swift
//  PKHUD
//
//  Created by Philip Kluz on 6/13/14.
//  Copyright (c) 2016 NSExceptional. All rights reserved.
//  Licensed under the MIT license.
//

#if os(iOS) || os(watchOS)
    import UIKit
#elseif os(OSX)
    import Cocoa
#endif

/// The PKHUD object controls showing and hiding of the HUD, as well as its contents and touch response behavior.
open class PKHUD: NSObject {
    
    fileprivate struct Constants {
        static let sharedHUD = PKHUD()
    }
    
    public var viewToPresentOn: View?

    fileprivate let container = ContainerView()
    fileprivate var hideTimer: Timer?
    
    public typealias TimerAction = (Bool) -> Void
    fileprivate var timerActions = [String: TimerAction]()
    
    // MARK: Public
    
    open class var sharedHUD: PKHUD {
        return Constants.sharedHUD
    }
    
    public override init () {
        super.init()
        #if os(iOS) || os(watchOS)
        NotificationCenter.default.addObserver(self,
            selector: #selector(PKHUD.willEnterForeground(_:)),
            name: NSNotification.Name.UIApplicationWillEnterForeground,
            object: nil)
        #endif
        userInteractionOnUnderlyingViewsEnabled = false
        container.frameView.autoresizingMask = [ .flexibleLeftMargin,
                                                 .flexibleRightMargin,
                                                 .flexibleTopMargin,
                                                 .flexibleBottomMargin ]
    }
    
    public convenience init(viewToPresentOn view: View?) {
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
    
    open var contentView: View {
        get {
            return container.frameView.content
        }
        set {
            container.frameView.content = newValue
            startAnimatingContentView()
        }
    }
    
    #if os(iOS) || os(watchOS)
    open var effect: UIVisualEffect? {
        get {
            return container.frameView.effect
        }
        set {
            container.frameView.effect = newValue
        }
    }
    #endif
    
    open func show() {
        #if os(iOS) || os(watchOS)
        guard let view = viewToPresentOn ?? UIApplication.shared.keyWindow ?? UIApplication.shared.windows.first else {
            preconditionFailure("HUD has no view to present on")
        }
        #elseif os(OSX)
        guard let view = viewToPresentOn ?? NSApplication.shared().orderedWindows.first?.contentView else {
            preconditionFailure("HUD has no view to present on")
        }
        #endif
        if(!view.subviews.contains(container)) {
            view.addSubview(container)
            container.frame.origin = CGPoint.zero
            container.frame.size = view.frame.size
            container.autoresizingMask = [ .flexibleHeight, .flexibleWidth ]
        }


        container.showFrameView()
        if dimsBackground {
            container.showBackground(animated: true)
        }
        
        startAnimatingContentView()
    }
    
    open func hide(animated anim: Bool = true, completion: TimerAction? = nil) {
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
    
    internal func willEnterForeground(_ notification: Notification?) {
        self.startAnimatingContentView()
    }
    
    internal func performDelayedHide(_ timer: Timer? = nil) {
        let userInfo = timer?.userInfo as? Dictionary<String, AnyObject>
        let key = userInfo?["timerActionKey"] as? String
        var completion: TimerAction?
        
        if let key = key, let action = timerActions[key] {
            completion = action
            timerActions[key] = nil
        }
        
        hide(animated: true, completion: completion);
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
}
