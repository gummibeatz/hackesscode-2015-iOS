//
//  ViewController.swift
//  Hackathon2015
//
//  Created by Michael Kavouras on 10/30/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIViewControllerTransitioningDelegate {
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let viewController = segue.destinationViewController as? CreateMentorViewController {
            viewController.transitioningDelegate = self
            viewController.modalPresentationStyle = UIModalPresentationStyle.Custom
        }
    }

}

