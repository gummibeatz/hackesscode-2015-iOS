//
//  UIView+Xib.swift
//  Hackathon2015
//
//  Created by Michael Kavouras on 11/1/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

import UIKit

extension UIView {
  
    class func viewFromNib(nibName: String) -> UIView? {
        if let view = NSBundle.mainBundle().loadNibNamed(nibName, owner: self, options: nil).first as? UIView {
            return view
        }
        return nil
    }
}