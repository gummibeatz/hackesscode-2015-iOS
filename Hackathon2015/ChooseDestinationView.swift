//
//  ChooseDestinationView.swift
//  Hackathon2015
//
//  Created by Michael Kavouras on 11/6/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

import UIKit

class ChooseDestinationView: CreateContactOnboardingView {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var amAContactButton: UnderlineButton!
    @IBOutlet weak var lookingForAContactButton: UnderlineButton!
    
    var onContactSelectedHandler: (() -> ())?
    var onNeedContactSelectedHandler: (() -> ())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        animationViews.append(titleLabel)
        animationViews.append(amAContactButton)
        animationViews.append(lookingForAContactButton)
    }
    
    @IBAction func amAContactButtonTapped(sender: AnyObject) {
        if let handler = onContactSelectedHandler {
            handler()
        }
    }
    
    @IBAction func lookingForAContactButtonTapped(sender: AnyObject) {
        if let handler = onNeedContactSelectedHandler {
            handler()
        }
    }
    
    override func pointInside(point: CGPoint, withEvent event: UIEvent?) -> Bool {
        return CGRectContainsPoint(bounds, point) || CGRectContainsPoint(amAContactButton.frame, point) || CGRectContainsPoint(lookingForAContactButton.frame, point)
    }
}
