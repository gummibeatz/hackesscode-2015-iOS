//
//  AnimationView.swift
//  Pods
//
//  Created by Michael Kavouras on 11/3/15.
//
//

import UIKit
import pop

enum AnimationDirection {
    case None
    case Left
    case Right
    case Top
    case Bottom
}

class AnimationView: UIView {
    
    var animationViews = [UIView]()
    var animateInDirection: AnimationDirection = .None {
        didSet {
            switch animateInDirection {
            case .Bottom, .Top, .Left: alpha = 1.0
            case .Bottom:
               center.y += UIScreen.mainScreen().bounds.size.height
            case .Top:
                center.y -= UIScreen.mainScreen().bounds.size.height
            case .Left:
                center.x -= UIScreen.mainScreen().bounds.size.width
            case .Right:
                center.x += UIScreen.mainScreen().bounds.size.width
            }
        }
    }
    
    var animateOutDirection: AnimationDirection = .None
    
    func animateIn(duration: Double = 0.1, completion: (() -> ())? = nil) {
        switch animateInDirection {
        case .Bottom:
            animateInFromBottom(duration, completion: completion)
        case .Top:
            animateInFromTop(duration, completion: completion)
        case .Left:
            animateInFromLeft(duration, completion: completion)
        case .Right:
            animateInFromRight(duration, completion: completion)
        default: break
        }
    }
    
    private func animateInFromTop(duration: Double, completion: (() -> ())? = nil) {
        for (idx, view) in animationViews.reverse().enumerate() {
            let animation = POPSpringAnimation(propertyNamed: kPOPLayerTranslationY)
            animation.beginTime = CACurrentMediaTime() + Double(idx) * duration
            animation.springBounciness = 7
            animation.dynamicsTension = 120.0
            animation.toValue = UIScreen.mainScreen().bounds.size.height
            view.layer.pop_addAnimation(animation, forKey: kPOPLayerTranslationY)
        }
    }
    
    private func animateInFromBottom(duration: Double, completion: (() -> ())? = nil) {
        for (idx, view) in animationViews.enumerate() {
            let animation = POPSpringAnimation(propertyNamed: kPOPLayerTranslationY)
            animation.beginTime = CACurrentMediaTime() + Double(idx) * duration
            animation.springBounciness = 7
            animation.dynamicsTension = 120.0
            animation.toValue = -UIScreen.mainScreen().bounds.size.height
            view.layer.pop_addAnimation(animation, forKey: kPOPLayerTranslationY)
        }
    }
    
    private func animateInFromLeft(duration: Double, completion: (() -> ())? = nil) {
        for (idx, view) in animationViews.enumerate() {
            let animation = POPSpringAnimation(propertyNamed: kPOPLayerTranslationX)
            animation.beginTime = CACurrentMediaTime() + Double(idx) * duration
            animation.springBounciness = 7
            animation.dynamicsTension = 120.0
            animation.toValue = UIScreen.mainScreen().bounds.size.width
            view.layer.pop_addAnimation(animation, forKey: kPOPLayerTranslationX)
        }
    }
    
    private func animateInFromRight(duration: Double, completion: (() -> ())? = nil) {
        for (idx, view) in animationViews.enumerate() {
            let animation = POPSpringAnimation(propertyNamed: kPOPLayerTranslationX)
            animation.beginTime = CACurrentMediaTime() + Double(idx) * duration
            animation.springBounciness = 7
            animation.dynamicsTension = 120.0
            animation.toValue = -UIScreen.mainScreen().bounds.size.width
            view.layer.pop_addAnimation(animation, forKey: kPOPLayerTranslationX)
        }
    }
    
    private func animateViews(views: [UIView], duration: Double, toValue: AnyObject!, property: String) {
        for (idx, view) in views.enumerate() {
            let animation = POPSpringAnimation(propertyNamed: property)
            animation.beginTime = CACurrentMediaTime() + Double(idx) * duration
            animation.springBounciness = 7
            animation.dynamicsTension = 120.0
            animation.toValue = toValue
            view.layer.pop_addAnimation(animation, forKey: property)
        }

    }
    
    private func fadeIn(duration: Double = 0.1, completion: (() -> ())? = nil) {
        UIView.animateWithDuration(duration, animations: {
            self.alpha = 1.0
        })
    }
    
    func animateOut(duration: Double = 0.1, completion: (() -> ())? = nil) {
        UIView.animateWithDuration(duration, animations: {
            self.alpha = 0.0
        })
    }

}
