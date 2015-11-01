//
//  CircleImageView.swift
//  Hackathon2015
//
//  Created by Michael Kavouras on 10/31/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

import UIKit

@IBDesignable
class DesignableImageView: UIImageView {
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor = UIColor.clearColor() {
        didSet {
            layer.borderColor = borderColor.CGColor
        }
    }

}
