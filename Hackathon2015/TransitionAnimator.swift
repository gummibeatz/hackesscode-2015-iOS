//
//  TransitionAnimator.swift
//  Hackathon2015
//
//  Created by Michael Kavouras on 11/1/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

import UIKit

class TransitionAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    var presenting = false
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 0.3;
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        
        let fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)
        let toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)
        
        if let fromViewController = fromViewController,
            toViewController = toViewController {
        
                
                if presenting {
                    fromViewController.view.userInteractionEnabled = false
            
                    transitionContext.containerView()?.addSubview(fromViewController.view)
                    transitionContext.containerView()?.addSubview(toViewController.view)
                    
                    toViewController.view.alpha = 0.0
                    
                    UIView.animateWithDuration(transitionDuration(transitionContext), animations: {
                        toViewController.view.alpha = 1.0
                        }, completion: { (done: Bool) -> Void in
                            transitionContext.completeTransition(true)
                    })
                } else {
                    transitionContext.containerView()?.addSubview(toViewController.view)
                    transitionContext.containerView()?.addSubview(fromViewController.view)
                    
                    UIView.animateWithDuration(transitionDuration(transitionContext), animations: {
                        fromViewController.view.alpha = 0.0
                        }, completion: { (done: Bool) -> Void in
                            toViewController.view.userInteractionEnabled = true
                            transitionContext.completeTransition(true)
                            
                            // this is a stupid hack. without it the root view controller is removed and we're left with a black screen
                            UIApplication.sharedApplication().keyWindow!.addSubview(toViewController.view)
                    })
                }
        }
 
    }
}

