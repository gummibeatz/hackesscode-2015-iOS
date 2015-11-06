//
//  CreateCreatorDisclaimerView.swift
//  Hackathon2015
//
//  Created by Michael Kavouras on 11/1/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

import UIKit

class CreateContactDisclaimerView: AnimationView {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    @IBOutlet weak var continueButton: UnderlineButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        animationViews.append(titleLabel)
        animationViews.append(bodyLabel)
        animationViews.append(continueButton)
    }

    @IBAction func continueButtonTapped(sender: AnyObject) {
        animateOut()
    }
    
    override func pointInside(point: CGPoint, withEvent event: UIEvent?) -> Bool {
        if CGRectContainsPoint(bounds, point) || CGRectContainsPoint(continueButton.frame, point) {
            return true
        }
        return false
    }
    
}
