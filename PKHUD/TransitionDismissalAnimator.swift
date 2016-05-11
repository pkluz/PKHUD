//
//  TransitionDismissalAnimator.swift
//  PKHUD
//
//  Created by Fabian Renner on 11.05.16.
//  Copyright © 2016 NSExceptional. All rights reserved.
//

import UIKit

class TransitionDismissalAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    var fromViewController: OverlayViewController!
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 0.8
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey) as! OverlayViewController
        
        let animationDuration = self.transitionDuration(transitionContext)
        
        UIView.animateWithDuration(
            animationDuration,
            animations: {
                self.fromViewController.frameView.alpha = 0.0
            },
            completion: { _ in
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled())
            }
        )
    }
    
    func animationEnded(transitionCompleted: Bool) {
        if transitionCompleted {
            self.fromViewController.frameView.alpha = 1
        }
    }
    
}
