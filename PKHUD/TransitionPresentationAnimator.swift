//
//  TransitionPresentationAnimator.swift
//  PKHUD
//
//  Created by Fabian Renner on 11.05.16.
//  Copyright © 2016 NSExceptional. All rights reserved.
//

import UIKit

class TransitionPresentationAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 0.175
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        let toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey) as! OverlayViewController
        let containerView = transitionContext.containerView()
        
        containerView?.addSubview(toViewController.view)
        
        let animationDuration = self .transitionDuration(transitionContext)
        
        UIView.animateWithDuration(
            animationDuration,
            animations: {},
            completion: { (finished) -> Void in
                transitionContext.completeTransition(true)
            }
        )
    }
}
