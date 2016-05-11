//
//  OverlayViewController.swift
//  PKHUD
//
//  Created by Fabian Renner on 11.05.16.
//  Copyright © 2016 NSExceptional. All rights reserved.
//

import UIKit

class OverlayViewController: UIViewController {
    var dimsBackground: Bool
    let frameView = FrameView()

    init(dimmsBackground: Bool = true) {
        self.dimsBackground = dimmsBackground
        
        super.init(nibName: nil, bundle: nil)
        
        self.transitioningDelegate = self
        self.modalPresentationStyle = .Custom
    }
    
    override func loadView() {
        super.loadView()
        
        self.view.backgroundColor = UIColor.clearColor()
        
        self.view.addSubview(frameView)
        frameView.centerXAnchor.constraintEqualToAnchor(self.view.centerXAnchor).active = true
        frameView.centerYAnchor.constraintEqualToAnchor(self.view.centerYAnchor).active = true
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        if let animatingView = frameView.content as? PKHUDAnimating {
            animatingView.startAnimation()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return self.presentingViewController?.preferredStatusBarStyle() ?? .Default
    }
}


extension OverlayViewController: UIViewControllerTransitioningDelegate {
    func presentationControllerForPresentedViewController(presented: UIViewController, presentingViewController presenting: UIViewController, sourceViewController source: UIViewController) -> UIPresentationController? {
        return PresentationController(presentedViewController: presented, presentingViewController: presenting, dimmsBackground: self.dimsBackground)
    }
    
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return TransitionPresentationAnimator()
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return TransitionDismissalAnimator()
    }
}
