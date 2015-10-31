//
//  UnderlineButton.swift
//  Hackathon2015
//
//  Created by Michael Kavouras on 10/31/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

import UIKit

class UnderlineButton: UIButton {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        if let label = titleLabel,
            text = label.text {
                let attributedText = NSMutableAttributedString(string: text)
                let range = NSMakeRange(0, text.characters.count)
                attributedText.addAttribute(NSUnderlineStyleAttributeName, value: NSUnderlineStyle.StyleSingle.rawValue, range: range)
                setAttributedTitle(attributedText, forState: .Normal)
        }

    }

}
