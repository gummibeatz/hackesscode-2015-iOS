//
//  ViewController.swift
//  Hackathon2015
//
//  Created by Michael Kavouras on 10/30/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

import UIKit
import Parse

class ViewController: UIViewController,
    UIViewControllerTransitioningDelegate {
    
    lazy var introView: AnimationView = {
        if let v = UIView.viewFromNib("ChooseDestinationView") as? ChooseDestinationView {
            v.center = self.view.center
            v.frame.size.width -= 110
            v.center.x += 55 - v.frame.origin.x
//            v.animateInDirection = .Bottom
            return v
        }
        
        return AnimationView()
    }()
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        view.addSubview(introView)
//        introView.animateIn(8.0)
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let viewController = segue.destinationViewController as? CreateContactViewController {
            viewController.transitioningDelegate = self
            viewController.modalPresentationStyle = .Custom
        }
    }

    // MARK: View controller transitioning delegate
    
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        return TransitionAnimator()
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        return TransitionAnimator()
    }
}

