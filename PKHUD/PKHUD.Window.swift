//
//  HUDWindow.swift
//  PKHUD
//
//  Created by Philip Kluz on 6/16/14.
//  Copyright (c) 2014 NSExceptional. All rights reserved.
//

import UIKit

extension PKHUD {
    
    /**
        The window used to display the PKHUD within. Placed atop the applications main window.
    */
    class Window: UIWindow {
        
        let frameView: PKHUD.FrameView
        @lazy var backgroundView: UIView = {
            let view = UIView()
            view.backgroundColor = UIColor(white:0.0, alpha:0.25)
            view.alpha = 0.0;
            return view;
        }()
        
        init(frameView: PKHUD.FrameView = PKHUD.FrameView()) {
            self.frameView = frameView
            super.init(frame: UIApplication.sharedApplication().delegate.window!.bounds)
            self.rootViewController = PKHUD.WindowRootViewController()
            self.windowLevel = UIWindowLevelNormal + 1.0
            
            self.addSubview(self.backgroundView)
            self.addSubview(self.frameView)
            
            self.backgroundColor = UIColor.clearColor()
        }
        
        override func layoutSubviews() {
            super.layoutSubviews()
            
            self.frameView.center = self.center
            self.backgroundView.frame = self.bounds
        }
        
        func showFrameView() {
            self.layer.removeAllAnimations()
            self.makeKeyAndVisible()
            self.frameView.center = self.center
            self.frameView.alpha = 1.0
            self.hidden = false
        }
        
        var willHide: Bool = false
        func hideFrameView(animated anim: Bool) {
            let completion: (finished: Bool) -> (Void) = { finished in
                if finished {
                    self.hidden = true
                    self.resignKeyWindow()
                }
                
                self.willHide = false
            }
            
            if self.hidden {
                return
            }
            
            self.willHide = true
            
            if anim {
                UIView.animateWithDuration(0.8, animations: { self.frameView.alpha = 0.0 }, completion)
            } else {
                completion(finished: true)
            }
        }
        
        func showBackground(animated anim: Bool) {
            if anim {
                UIView.animateWithDuration(0.175) {
                    self.backgroundView.alpha = 1.0
                }
            } else {
                self.backgroundView.alpha = 1.0;
            }
        }
        
        func hideBackground(animated anim: Bool) {
            if anim {
                UIView.animateWithDuration(0.65) {
                    self.backgroundView.alpha = 0.0
                }
            } else {
                self.backgroundView.alpha = 0.0;
            }
        }
    }
}
