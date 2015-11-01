//
//  CreateMentorViewController.swift
//  Hackathon2015
//
//  Created by Michael Kavouras on 10/31/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

import UIKit

class CreateMentorViewController: UIViewController {

    @IBOutlet weak var contentViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var contentViewWidthConstraint: NSLayoutConstraint!
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        contentViewHeightConstraint.constant = view.frame.size.height
        contentViewWidthConstraint.constant = view.frame.size.width
    }
    
}
