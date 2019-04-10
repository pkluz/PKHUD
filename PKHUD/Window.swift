//
//  HUDWindow.swift
//  PKHUD
//
//  Created by Philip Kluz on 6/16/14.
//  Copyright (c) 2016 NSExceptional. All rights reserved.
//  Licensed under the MIT license.
//

import UIKit

/// The window used to display the PKHUD within. Placed atop the applications main window.
internal class ContainerView: UIView {

    private var keyboardIsVisible = false
    private var keyboardHeight: CGFloat = 0.0
    
    internal let frameView: FrameView
    internal init(frameView: FrameView = FrameView()) {
        self.frameView = frameView
        super.init(frame: CGRect.zero)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        frameView = FrameView()
        super.init(coder: aDecoder)
        commonInit()
    }

    fileprivate func commonInit() {
        backgroundColor = UIColor.clear
        isHidden = true

        addSubview(backgroundView)
        addSubview(frameView)
    }

    internal override func layoutSubviews() {
        super.layoutSubviews()

        frameView.center = calculateHudCenter()
        backgroundView.frame = bounds
    }
    
    

    internal func showFrameView() {
        layer.removeAllAnimations()
        frameView.center = calculateHudCenter()
        frameView.alpha = 1.0
        isHidden = false
    }

    fileprivate var willHide = false

    internal func hideFrameView(animated anim: Bool, completion: ((Bool) -> Void)? = nil) {
        let finalize: (_ finished: Bool) -> Void = { finished in
            self.isHidden = true
            self.removeFromSuperview()
            self.willHide = false

            completion?(finished)
        }

        if isHidden {
            return
        }

        willHide = true

        if anim {
            UIView.animate(withDuration: 0.8, animations: {
                self.frameView.alpha = 0.0
                self.hideBackground(animated: false)
            }, completion: { _ in finalize(true) })
        } else {
            self.frameView.alpha = 0.0
            finalize(true)
        }
    }

    fileprivate let backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.0, alpha: 0.25)
        view.alpha = 0.0
        return view
    }()

    internal func showBackground(animated anim: Bool) {
        if anim {
            UIView.animate(withDuration: 0.175, animations: {
                self.backgroundView.alpha = 1.0
            })
        } else {
            backgroundView.alpha = 1.0
        }
    }

    internal func hideBackground(animated anim: Bool) {
        if anim {
            UIView.animate(withDuration: 0.65, animations: {
                self.backgroundView.alpha = 0.0
            })
        } else {
            backgroundView.alpha = 0.0
        }
    }
    
    // MARK: Notifications
    internal func registerForKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillBeHidden(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    internal func deregisterFromKeyboardNotifications() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    // MARK: Triggered Functions
    @objc private func keyboardWillShow(notification: NSNotification) {
        keyboardIsVisible = true
        guard let userInfo = notification.userInfo else {
            return
        }
        if let keyboardHeight = (userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue.height {
            self.keyboardHeight = keyboardHeight
        }
        if !self.isHidden {
            if let duration = userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? NSNumber,
                let curve = userInfo[UIResponder.keyboardAnimationCurveUserInfoKey] as? NSNumber {
                animateHUDWith(duration: duration.doubleValue,
                               curve: UIView.AnimationCurve(rawValue: curve.intValue) ?? UIView.AnimationCurve.easeInOut,
                               toLocation: calculateHudCenter())
            }
        }
    }
    
    @objc private func keyboardWillBeHidden(notification: NSNotification) {
        keyboardIsVisible = false
        if !self.isHidden {
            guard let userInfo = notification.userInfo else {
                return
            }
            if let duration = userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? NSNumber,
                let curve = userInfo[UIResponder.keyboardAnimationCurveUserInfoKey] as? NSNumber {
                animateHUDWith(duration: duration.doubleValue,
                               curve: UIView.AnimationCurve(rawValue: curve.intValue) ?? UIView.AnimationCurve.easeInOut,
                               toLocation: calculateHudCenter())
            }
        }
    }
    
    // MARK: - Helpers
    private func animateHUDWith(duration: Double, curve: UIView.AnimationCurve, toLocation location: CGPoint) {
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDuration(TimeInterval(duration))
        UIView.setAnimationCurve(curve)
        frameView.center = location
        UIView.commitAnimations()
    }
    
    private func calculateHudCenter() -> CGPoint {
        if !keyboardIsVisible {
            return center
        } else {
            let yLocation = (frame.height - keyboardHeight) / 2
            return CGPoint(x: center.x, y: yLocation)
        }
    }
}
