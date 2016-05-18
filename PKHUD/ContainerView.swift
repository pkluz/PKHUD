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
        
        let left = NSLayoutConstraint(item: backgroundView, attribute: .Left, relatedBy: .Equal, toItem: self, attribute: .Left, multiplier: 1, constant: 0)
        let top = NSLayoutConstraint(item: backgroundView, attribute: .Top, relatedBy: .Equal, toItem: self, attribute: .Top, multiplier: 1, constant: 0)
        let right = NSLayoutConstraint(item: backgroundView, attribute: .Right, relatedBy: .Equal, toItem: self, attribute: .Right, multiplier: 1, constant: 0)
        let bottom = NSLayoutConstraint(item: backgroundView, attribute: .Bottom, relatedBy: .Equal, toItem: self, attribute: .Bottom, multiplier: 1, constant: 0)
        
        let centerX = NSLayoutConstraint(item: frameView, attribute: .CenterX, relatedBy: .Equal, toItem: self, attribute: .CenterX, multiplier: 1, constant: 0)
        let centerY = NSLayoutConstraint(item: frameView, attribute: .CenterY, relatedBy: .Equal, toItem: self, attribute: .CenterY, multiplier: 1, constant: 0)
        
        self.addConstraints([left, top, right, bottom])
        self.addConstraints([centerX, centerY])
    }
    
    internal func showFrameView() {
        layer.removeAllAnimations()
        frameView.alpha = 1.0
        
        let width = NSLayoutConstraint(item: frameView, attribute: .Width, relatedBy: .Equal, toItem: frameView.content, attribute: .Width, multiplier: 1, constant: 0)
        let height = NSLayoutConstraint(item: frameView, attribute: .Height, relatedBy: .Equal, toItem: frameView.content, attribute: .Height, multiplier: 1, constant: 0)
        
        frameView.addConstraints([width, height])
        
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
