//
//  PresentationController.swift
//  PKHUD
//
//  Created by Fabian Renner on 11.05.16.
//  Copyright © 2016 NSExceptional. All rights reserved.
//

import UIKit

class PresentationController: UIPresentationController {
    
    let dimmsBackground: Bool

    private lazy var dimmingView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white:0.0, alpha:0.25)
        view.alpha = 0.0
        return view
    }()
    
    init(presentedViewController: UIViewController, presentingViewController: UIViewController, dimmsBackground: Bool) {
        self.dimmsBackground = dimmsBackground
        
        super.init(presentedViewController: presentedViewController, presentingViewController: presentingViewController)
    }
    
    override func presentationTransitionWillBegin() {
        guard dimmsBackground else {
            return
        }
        
        if let containerView = containerView {
            dimmingView.frame = containerView.bounds
            containerView.insertSubview(dimmingView, atIndex: 0)
        }
        
        presentedViewController.transitionCoordinator()?.animateAlongsideTransition({ context in
                self.dimmingView.alpha = 1
            }
            , completion: nil
        )
    }
    
    override func dismissalTransitionWillBegin() {
        guard dimmsBackground else {
            return
        }
        
        presentedViewController.transitionCoordinator()?.animateAlongsideTransition({ context in
                self.dimmingView.alpha = 0
            }
            , completion: nil
        )
    }
    
    override func containerViewWillLayoutSubviews() {
        if let containerView = containerView {
            dimmingView.frame = containerView.bounds
        }
        
        self.presentedView()?.frame = self.frameOfPresentedViewInContainerView()
    }
}
