//
//  Contact.swift
//  Hackathon2015
//
//  Created by Michael Kavouras on 10/31/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

import UIKit
import Parse

class Contact: PFUser {
    
    @NSManaged var name: String
    @NSManaged var company: String
    @NSManaged var jobTitle: String
    @NSManaged var gender: String
    @NSManaged var bio: String
    @NSManaged var language: String

}
