//
//  UINavigation+Awesome.swift
//  LPNavigationBar
//
//  Created by litt1e-p on 16/1/4.
//  Copyright © 2016年 litt1e-p. All rights reserved.
//

import UIKit
import ObjectiveC

extension UINavigationBar {
    
    private struct AssociatedKeys {
        static var UINavigationBarAwesomeRef = "UINavigationBarAwesome"
    }
    
    var overlay: UIView? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.UINavigationBarAwesomeRef) as? UIView
        }
        
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.UINavigationBarAwesomeRef, newValue as UIView?, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    func lp_setBackgroundColor(backgroundColor: UIColor) {
        if self.overlay == nil {
            self.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
            self.overlay = UIView(frame: CGRectMake(0, -20, UIScreen.mainScreen().bounds.size.width, CGRectGetHeight(self.bounds) + 20))
            self.overlay!.userInteractionEnabled = false
            self.overlay!.autoresizingMask = [UIViewAutoresizing.FlexibleWidth, UIViewAutoresizing.FlexibleHeight]
            
            self.insertSubview(self.overlay!, atIndex: 0)
        }
        self.overlay!.backgroundColor = backgroundColor
    }
    
    func lp_setTranslationY(translationY: CGFloat) {
        self.transform = CGAffineTransformMakeTranslation(0, translationY)
    }
    
    func lp_setElementsAlpha(alpha: CGFloat) {
        self.valueForKey("_leftViews")?.enumerateObjectsUsingBlock({(obj, i, stop) -> Void in
            if let view = obj as? UIView {
                view.alpha = alpha
            }
        })
        
        self.valueForKey("_rightViews")?.enumerateObjectsUsingBlock({(obj, i, stop) -> Void in
            if let view = obj as? UIView {
                view.alpha = alpha
            }
        })
        
        let titleView = self.valueForKey("_titleView") as? UIView
        titleView?.alpha = alpha
        
        for subview in self.subviews {
            if subview.isKindOfClass(NSClassFromString("UINavigationItemView")!) {
                subview.alpha = alpha
                break
            }
        }
    }
    
    func lp_reset() {
        self.setBackgroundImage(nil, forBarMetrics: UIBarMetrics.Default)
        self.overlay?.removeFromSuperview()
        self.overlay = nil
    }
}

