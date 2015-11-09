//
//  CreateContactCompanyView.swift
//  Hackathon2015
//
//  Created by Michael Kavouras on 11/7/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

import UIKit

class CreateContactCompanyView: CreateContactOnboardingView {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var continueButton: UnderlineButton!
    @IBOutlet weak var bodyLabel: UILabel!
    @IBOutlet weak var body2Label: UILabel!
    @IBOutlet weak var jobTitleTextField: UITextField!
    @IBOutlet weak var companyTextField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        animationViews.append(titleLabel)
        animationViews.append(bodyLabel)
        animationViews.append(companyTextField)
        animationViews.append(continueButton)
//        animationViews.append(body2Label)
//        animationViews.append(jobTitleTextField)
        
        body2Label.alpha = 0.0
//        jobTitleTextField.alpha = 0.0
    }
    
    func next() {
        UIView.animateWithDuration(0.6, animations: { () -> Void in
            self.companyTextField.alpha = 0.0
            self.bodyLabel.alpha = 0.0
            }) { (done: Bool) -> Void in
                UIView.animateWithDuration(0.3, animations: { () -> Void in
                    self.body2Label.alpha = 1.0
                    }, completion: { (done: Bool) -> Void in
                })
        }
    }

    @IBAction func continueButtonTapped(sender: AnyObject) {
        if let handler = onContinueSelectedHandler {
            handler()
        }
    }
    
    override func animateIn(duration: NSTimeInterval=0.05, completion: (() -> ())?=nil) {
        super.animateIn(duration, completion: {
            self.companyTextField.becomeFirstResponder()
            if let handler = completion {
                handler()
            }
        })
    }
    
    override func pointInside(point: CGPoint, withEvent event: UIEvent?) -> Bool {
        let buttonFrame = CGRectOffset(continueButton.frame, 0, 0)
        let textfieldFrame = CGRectOffset(companyTextField.frame, 0, 0)
        print("point: \(point), frame: \(buttonFrame)")
        if CGRectContainsPoint(bounds, point) || CGRectContainsPoint(buttonFrame, point) || CGRectContainsPoint(textfieldFrame, point) {
            return true
        }
        return false
    }

}
