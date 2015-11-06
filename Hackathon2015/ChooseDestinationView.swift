//
//  ChooseDestinationView.swift
//  Hackathon2015
//
//  Created by Michael Kavouras on 11/6/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

import UIKit

class ChooseDestinationView: AnimationView {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var amAContactButton: UnderlineButton!
    @IBOutlet weak var lookingForAContactButton: UnderlineButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        animationViews.append(titleLabel)
        animationViews.append(amAContactButton)
        animationViews.append(lookingForAContactButton)
    }
    
    override func pointInside(point: CGPoint, withEvent event: UIEvent?) -> Bool {
        return CGRectContainsPoint(bounds, point) || CGRectContainsPoint(amAContactButton.frame, point) || CGRectContainsPoint(lookingForAContactButton.frame, point)
    }
}
