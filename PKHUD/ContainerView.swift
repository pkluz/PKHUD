//
//  ContainerView.swift
//  Pods
//
//  Created by Fabian Renner on 21.04.16.
//
//

import UIKit

internal class ContainerView: UIView {
    
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
    
    private func commonInit() {
        backgroundColor = UIColor.clearColor()
        self.translatesAutoresizingMaskIntoConstraints = false

        
        addSubview(backgroundView)
        addSubview(frameView)
        
        backgroundView.topAnchor.constraintEqualToAnchor(self.topAnchor).active = true
        backgroundView.rightAnchor.constraintEqualToAnchor(self.rightAnchor).active = true
        backgroundView.bottomAnchor.constraintEqualToAnchor(self.bottomAnchor).active = true
        backgroundView.leftAnchor.constraintEqualToAnchor(self.leftAnchor).active = true
        
        frameView.centerXAnchor.constraintEqualToAnchor(self.centerXAnchor).active = true
        frameView.centerYAnchor.constraintEqualToAnchor(self.centerYAnchor).active = true
    }
    
    internal func showFrameView() {
        layer.removeAllAnimations()
        frameView.alpha = 1.0
        frameView.widthAnchor.constraintEqualToAnchor(frameView.content.widthAnchor).active = true
        frameView.heightAnchor.constraintEqualToAnchor(frameView.content.heightAnchor).active = true

        hidden = false
    }
    
    private var willHide = false
    
    internal func hideFrameView(animated anim: Bool, completion: ((Bool) -> Void)? = nil) {
        let finalize: (finished: Bool) -> (Void) = { finished in
            if finished {
                self.hidden = true
                self.removeFromSuperview()
            }
            
            self.willHide = false
            completion?(finished)
        }
        
        if hidden {
            return
        }
        
        willHide = true
        
        if anim {
            UIView.animateWithDuration(0.8, animations: {
                self.frameView.alpha = 0.0
                self.hideBackground(animated: false)
                }, completion: finalize)
        } else {
            self.frameView.alpha = 0.0
            finalize(finished: true)
        }
    }
    
    private let backgroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(white:0.0, alpha:0.25)
        view.alpha = 0.0
        return view
    }()
    
    internal func showBackground(animated anim: Bool) {
        if anim {
            UIView.animateWithDuration(0.175) {
                self.backgroundView.alpha = 1.0
            }
        } else {
            backgroundView.alpha = 1.0
        }
    }
    
    internal func hideBackground(animated anim: Bool) {
        if anim {
            UIView.animateWithDuration(0.65) {
                self.backgroundView.alpha = 0.0
            }
        } else {
            backgroundView.alpha = 0.0
        }
    }
}
