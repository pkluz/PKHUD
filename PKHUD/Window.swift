//
//  HUDWindow.swift
//  PKHUD
//
//  Created by Philip Kluz on 6/16/14.
//  Copyright (c) 2014 NSExceptional. All rights reserved.
//

import UIKit

/// The window used to display the PKHUD within. Placed atop the applications main window.
internal class Window: UIWindow {
    
    internal let frameView: FrameView
    internal init(frameView: FrameView = FrameView()) {
        self.frameView = frameView
        super.init(frame: UIApplication.sharedApplication().delegate!.window!!.bounds)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        frameView = FrameView()
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        rootViewController = WindowRootViewController()
        windowLevel = UIWindowLevelNormal + 1.0
        backgroundColor = UIColor.clearColor()
        
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
        hidden = false
    }
    
    private var willHide = false
    
    internal func hideFrameView(animated anim: Bool) {
        let completion: (finished: Bool) -> (Void) = { finished in
            if finished {
                self.hidden = true
                self.resignKeyWindow()
            }
            
            self.willHide = false
        }
        
        if hidden {
            return
        }
        
        willHide = true
        
        if anim {
            UIView.animateWithDuration(0.8, animations: { self.frameView.alpha = 0.0 }, completion: completion)
        } else {
            completion(finished: true)
        }
    }
    
    private let backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white:0.0, alpha:0.25)
        view.alpha = 0.0;
        return view;
    }()
    
    internal func showBackground(animated anim: Bool) {
        if anim {
            UIView.animateWithDuration(0.175) {
                self.backgroundView.alpha = 1.0
            }
        } else {
            backgroundView.alpha = 1.0;
        }
    }
    
    internal func hideBackground(animated anim: Bool) {
        if anim {
            UIView.animateWithDuration(0.65) {
                self.backgroundView.alpha = 0.0
            }
        } else {
            backgroundView.alpha = 0.0;
        }
    }
}
