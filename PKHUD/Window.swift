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
internal class Window: UIWindow {
    
    internal let frameView: FrameView
    internal init(frameView: FrameView = FrameView()) {
        self.frameView = frameView
        super.init(frame: UIApplication.shared.delegate!.window!!.bounds)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        frameView = FrameView()
        super.init(coder: aDecoder)
        commonInit()
    }
    
    fileprivate func commonInit() {
        rootViewController = WindowRootViewController()
        windowLevel = UIWindowLevelNormal + 500.0
        backgroundColor = UIColor.clear
        
        addSubview(backgroundView)
        addSubview(frameView)
    }
    
    internal override func layoutSubviews() {
        super.layoutSubviews()
        
        frameView.center = center
        backgroundView.frame = bounds
    }
    
    internal func showFrameView() {
        layer.removeAllAnimations()
        makeKeyAndVisible()
        frameView.center = center
        frameView.alpha = 1.0
        isHidden = false
    }
    
    fileprivate var willHide = false
    
    internal func hideFrameView(animated anim: Bool, completion: ((Bool) -> Void)? = nil) {
        let finalize: (_ finished: Bool) -> (Void) = { finished in
            self.isHidden = true
            self.resignKey()
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
            }, completion: { bool in finalize(true) } )
        } else {
            self.frameView.alpha = 0.0
            finalize(true)
        }
    }
    
    fileprivate let backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white:0.0, alpha:0.25)
        view.alpha = 0.0
        return view
    }()
    
    internal func showBackground(animated anim: Bool) {
        if anim {
            UIView.animate(withDuration: 0.175) {
                self.backgroundView.alpha = 1.0
            }
        } else {
            backgroundView.alpha = 1.0
        }
    }
    
    internal func hideBackground(animated anim: Bool) {
        if anim {
            UIView.animate(withDuration: 0.65) {
                self.backgroundView.alpha = 0.0
            }
        } else {
            backgroundView.alpha = 0.0
        }
    }
}
