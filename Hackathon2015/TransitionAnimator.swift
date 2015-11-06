//
//  TransitionAnimator.swift
//  Hackathon2015
//
//  Created by Michael Kavouras on 11/1/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

import UIKit

class TransitionAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 0.5;
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        
        let fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)
        let toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)
        
        if let fromViewController = fromViewController,
            toViewController = toViewController {
        
                fromViewController.view.userInteractionEnabled = false
        
                transitionContext.containerView()?.addSubview(fromViewController.view)
                transitionContext.containerView()?.addSubview(toViewController.view)
                
                toViewController.view.alpha = 0.0
                
                UIView.animateWithDuration(transitionDuration(transitionContext), animations: {
                    toViewController.view.alpha = 1.0
                    }, completion: { (done: Bool) -> Void in
                        transitionContext.completeTransition(true)
                })
        }
 
    }
}

