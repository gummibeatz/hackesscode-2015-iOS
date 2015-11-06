//
//  CreateContactViewController.swift
//  Hackathon2015
//
//  Created by Michael Kavouras on 11/1/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

import UIKit
import pop

class CreateContactViewController: UIViewController {
    
    lazy var disclaimerView: AnimationView = {
        if let v = UIView.viewFromNib("CreateContactDisclaimerView") as? CreateContactDisclaimerView {
            v.center = self.view.center
            v.frame.size.width -= 110
            v.center.x += 55 - v.frame.origin.x
            v.animateInDirection = .Bottom
            return v
        }
        
        return AnimationView()
    }()
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        view.addSubview(disclaimerView)
        disclaimerView.animateIn(0.05)
    }

}
