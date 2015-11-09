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
    
    lazy var disclaimerView: CreateContactDisclaimerView = {
        if let v = UIView.viewFromNib("CreateContactDisclaimerView") as? CreateContactDisclaimerView {
            v.frame = self.view.bounds
            v.animateInDirection = .Bottom
            return v
        }
        
        return CreateContactDisclaimerView()
    }()
    
    lazy var companyView: CreateContactCompanyView = {
        if let v = UIView.viewFromNib("CreateContactCompanyView") as? CreateContactCompanyView {
            v.frame = self.view.bounds
            v.animateInDirection = .Left
            return v
        }
        
        return CreateContactCompanyView()
    }()
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        view.addSubview(disclaimerView)
        view.addSubview(companyView)
        

        disclaimerView.onContinueSelectedHandler = {
            self.disclaimerView.animateOut(0.4, completion: { () -> () in
                self.showCompanyView()
                
                UIView.animateWithDuration(1.5, animations: { () -> Void in
                    self.view.backgroundColor = UIColor(red: 44/255.0, green: 56/255.0, blue: 88/255.0, alpha: 1.0)
                })
            })
        }
        
        companyView.onContinueSelectedHandler = {
            self.companyView.next()
//            self.companyView.animateOut(0.4, completion: { () -> () in
//                print("boop")
//            })
        }
        
        showDisclaimerView()
    }
    
    private func showDisclaimerView() {
        disclaimerView.animateIn()
    }
    
    private func showCompanyView() {
        companyView.animateIn()
    }

    @IBAction func closeButtonTapped(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
}
