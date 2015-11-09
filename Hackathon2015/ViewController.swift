//
//  ViewController.swift
//  Hackathon2015
//
//  Created by Michael Kavouras on 10/30/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

import UIKit
import Parse

struct StoryboardVC {
    static let CreateContact = "CreateContactIdentifer"
}

class ViewController: UIViewController,
    UIViewControllerTransitioningDelegate {
    
    lazy var introView: ChooseDestinationView = {
        if let v = UIView.viewFromNib("ChooseDestinationView") as? ChooseDestinationView {
            v.center = self.view.center
            v.frame.size.width -= 110
            v.center.x += 55 - v.frame.origin.x
            v.alpha = 0.0
            return v
        }
        return ChooseDestinationView()
    }()
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        view.addSubview(introView)

        introView.onContactSelectedHandler = {
            self.navigateToCreateContactFlow()
        }
        
        introView.onNeedContactSelectedHandler = {
            print("needs a contact")
        }
        
        introView.animateIn()
    }
    
    private func navigateToCreateContactFlow() {
        if let viewController = self.storyboard?.instantiateViewControllerWithIdentifier(StoryboardVC.CreateContact) {
            viewController.transitioningDelegate = self
            viewController.modalPresentationStyle = .Custom
            presentViewController(viewController, animated: true, completion: nil)
        }
    }

    // MARK: View controller transitioning delegate
    
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        let animator = TransitionAnimator()
        animator.presenting = true
        return animator
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        return TransitionAnimator()
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }

}

