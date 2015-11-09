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
    
    private let SPRING_BOUNCINESS: CGFloat = 7.0
    private let DYNAMICS_TENSION: CGFloat = 120.0
    
    var animationViews = [UIView]()
    var animateInDirection: AnimationDirection = .None {
        didSet {
            switch animateInDirection {
            case .Bottom:
               center.y += UIScreen.mainScreen().bounds.size.height
            case .Top:
                center.y -= UIScreen.mainScreen().bounds.size.height
            case .Left:
                center.x -= UIScreen.mainScreen().bounds.size.width
            case .Right:
                center.x += UIScreen.mainScreen().bounds.size.width
            default: break
            }
        }
    }
    
    var animateOutDirection: AnimationDirection = .None
    
    func animateIn(duration: NSTimeInterval = 0.05, completion: (() -> ())? = nil) {
        switch animateInDirection {
        case .Bottom: animateInFromBottom(duration, completion: completion)
        case .Top:    animateInFromTop(duration, completion: completion)
        case .Left:   animateInFromLeft(duration, completion: completion)
        case .Right:  animateInFromRight(duration, completion: completion)
        case .None:   fadeIn(duration, completion: completion)
        }
    }
    
    func animateOut(duration: NSTimeInterval = 0.05, completion: (() -> ())? = nil) {
        switch animateOutDirection {
        case .Bottom: animateOutToBottom(duration, completion: completion)
        case .Top:    animateOutToTop(duration, completion: completion)
        case .Left:   animateOutToLeft(duration, completion: completion)
        case .Right:  animateOutToRight(duration, completion: completion)
        case .None:   fadeOut(duration, completion: completion)
        }
    }
    
    // MARK: Animate in
    
    private func animateInFromTop(duration: Double, completion: (() -> ())? = nil) {
        animateViews(animationViews, duration: duration, toValue: UIScreen.mainScreen().bounds.size.height, property: kPOPLayerTranslationY, completion: completion)
    }
    
    private func animateInFromBottom(duration: Double, completion: (() -> ())? = nil) {
        animateViews(animationViews, duration: duration, toValue: -UIScreen.mainScreen().bounds.size.height, property: kPOPLayerTranslationY, completion: completion)
    }
    
    private func animateInFromLeft(duration: Double, completion: (() -> ())? = nil) {
        animateViews(animationViews, duration: duration, toValue: UIScreen.mainScreen().bounds.size.width, property: kPOPLayerTranslationX, completion: completion)
    }
    
    private func animateInFromRight(duration: Double, completion: (() -> ())? = nil) {
        animateViews(animationViews, duration: duration, toValue: -UIScreen.mainScreen().bounds.size.width, property: kPOPLayerTranslationX, completion: completion)
    }
    
    private func fadeIn(duration: Double = 0.8, completion: (() -> ())?) {
        UIView.animateWithDuration(duration, animations: { () -> Void in
            self.alpha = 1.0
            }) { (done: Bool) -> Void in
                if let completion = completion {
                    completion()
                }
        }
    }

    
    // MARK: Animate out
    
    private func animateOutToTop(duration: Double, completion: (() -> ())?) {
        animateViews(animationViews, duration: duration, toValue: -UIScreen.mainScreen().bounds.size.height * 2.0, property: kPOPLayerTranslationY, completion: completion)
    }
    
    private func animateOutToBottom(duration: Double, completion: (() -> ())?) {
        animateViews(animationViews, duration: duration, toValue: UIScreen.mainScreen().bounds.size.height * 2.0, property: kPOPLayerTranslationY, completion: completion)
    }
    
    private func animateOutToLeft(duration: Double, completion: (() -> ())?) {
        animateViews(animationViews, duration: duration, toValue: -UIScreen.mainScreen().bounds.size.width * 2.0, property: kPOPLayerTranslationX, completion: completion)
    }
    
    private func animateOutToRight(duration: Double, completion: (() -> ())?) {
        animateViews(animationViews, duration: duration, toValue: UIScreen.mainScreen().bounds.size.width * 2.0, property: kPOPLayerTranslationX, completion: completion)
    }
    
    private func fadeOut(duration: Double = 0.8, completion: (() -> ())?) {
        UIView.animateWithDuration(duration, animations: { () -> Void in
            self.alpha = 0.0
            }) { (done: Bool) -> Void in
                if let completion = completion {
                    completion()
                }
        }
    }
    
    // MARK: Helper
    
    private func animateViews(views: [UIView], duration: Double, toValue: AnyObject!, property: String, completion: (() -> ())?) {
        for (idx, view) in views.enumerate() {
            let animation = POPSpringAnimation(propertyNamed: property)
            animation.beginTime = CACurrentMediaTime() + Double(idx) * duration
            print("\(animation.beginTime) \(duration)")
            animation.springBounciness = SPRING_BOUNCINESS
            animation.dynamicsTension = DYNAMICS_TENSION
            animation.toValue = toValue
            if idx == views.count - 1 {
                if let completion = completion {
                    animation.completionBlock = { (animation, done) -> Void in
                        completion()
                    }
                }
            }
            view.layer.pop_addAnimation(animation, forKey: property)
        }

    }
    
//    override func hitTest(point: CGPoint, withEvent event: UIEvent?) -> UIView? {
//        for subview in subviews {
//            let subPoint = subview.convertPoint(point, fromView:self)
//            if let result = subview.hitTest(subPoint, withEvent: event) {
//                return result
//            }
//        }
//        return nil
//    }
    
}
