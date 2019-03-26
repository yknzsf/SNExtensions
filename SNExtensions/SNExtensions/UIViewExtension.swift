//
//  UIViewExtension.swift
//  SNExtensions
//
//  Created by shaofeng on 2017/3/17.
//  Copyright © 2017年 zsf. All rights reserved.
//

import Foundation
import UIKit

public extension UIView {
    
    //  get set origin.x
    var x: CGFloat {
        get {
            return frame.origin.x;
        }
        
        set {
            frame.origin.x = newValue;
        }
    }
    
    // get set origin.y
    var y: CGFloat {
        get {
            return frame.origin.y;
        }
        
        set {
            frame.origin.y = newValue;
        }
    }
    
    
    //  Get End X point of view
    var endX : CGFloat {
        return frame.origin.x + frame.width;
    }
    
    //  Get End Y point of view
    var endY : CGFloat {
        return frame.origin.y + frame.height;
    }
    
    //  Get width of View
    func getWidth() -> CGFloat {
        return frame.width;
    }
    
    //  Get height of view
    func getHeight() -> CGFloat {
        return frame.height;
    }
    
    //  Set view width
    func setWidth(width : CGFloat) {
        self.frame.size = CGSize(width: width, height: self.getHeight());
    }
    
    //  Set view height
    func setHeight(height : CGFloat) {
        self.frame.size = CGSize(width: self.getWidth(), height: height);
    }
    
    //  Set Center
    func setCenter(x : CGFloat, y : CGFloat) {
        self.center = CGPoint(x : x,y: y);
    }
    
    //  Get center
    func getCenter() -> CGPoint {
        return self.center;
    }
    
    // Set center.x
    func setCenterX(x: CGFloat) {
        self.center = CGPoint(x: x, y: self.getCenterY());
    }
    
    //  Get center.x
    func getCenterX() -> CGFloat {
        return self.center.x;
    }
    
    //  Set center.y
    func setCenterY(y : CGFloat)  {
        self.center = CGPoint(x : self.getCenterX(), y : y);
    }
    
    //  Get center.y
    func getCenterY() -> CGFloat {
        return self.center.y;
    }
    
    func setOrigin(origin: CGPoint) {
        var f = self.frame;
        f.origin = origin;
        self.frame = f;
    }
    
    func getOrigin() -> CGPoint {
        return self.frame.origin;
    }

    func getBottom() -> CGFloat {
        return self.frame.origin.y + self.frame.size.height;
    }
    
    func setBottom(bottom: CGFloat) {
        var frame = self.frame;
        frame.origin.y = bottom - frame.size.height;
        self.frame = frame;
    }
    
    func getTop() -> CGFloat {
        return self.frame.origin.y;
    }
    
    func setTop(top: CGFloat) {
        var frame = self.frame;
        frame.origin.y = top;
        self.frame = frame;
    }
    
    //  Get Parent View controller
    var parentViewController: UIViewController? {
        var parentResponder: UIResponder? = self;
        while parentResponder != nil {
            parentResponder = parentResponder!.next;
            if parentResponder is UIViewController {
                return parentResponder as? UIViewController;
            }
        }
        return nil;
    }
    
    //  Apply plain shadow to view
    func applyPlainShadow() {
        let layer = self.layer;
        
        layer.shadowColor = UIColor.black.cgColor;
        layer.shadowOffset = CGSize(width: 0, height: 3);
        layer.shadowOpacity = 0.5;
        layer.shadowRadius = 1.0;
    }
    
    //  Apply boarder to view
    func applyBorder() {
        self.layer.borderWidth = 1.0;
        self.layer.borderColor = UIColor.gray.cgColor;
    }
    
    //  Apply corner radius
    func applyCornerRadius(corenrRadius : CGFloat , mask : Bool) {
        self.layer.masksToBounds = mask;
        self.layer.cornerRadius = corenrRadius;
    }
    
    //  Add only bottom border
    func applyBottomBorder() {
        self.layer.borderWidth = 1.0;
        self.layer.borderColor = UIColor.gray.cgColor;
    }
    
    //  Add Top Border
    func addTopBorderWithColor(color: UIColor, width: CGFloat) {
        let border = CALayer();
        border.backgroundColor = color.cgColor;
        border.frame = CGRect(x: 0, y: 0, width: self.getWidth(), height: width);
        self.layer.addSublayer(border);
    }
    
    //  Add Right Border
    func addRightBorderWithColor(color: UIColor, width: CGFloat) {
        let border = CALayer();
        border.backgroundColor = color.cgColor;
        border.frame = CGRect(x: self.getWidth() - width, y: 0, width: width, height: self.getHeight());
        self.layer.addSublayer(border);
    }
    
    //  Add Bottom Border
    func addBottomBorderWithColor(color: UIColor, width: CGFloat) {
        let border = CALayer();
        border.backgroundColor = color.cgColor;
        border.frame = CGRect(x: 0, y: self.getHeight() - width, width: self.getWidth(), height: width);
        self.layer.addSublayer(border);
    }
    
    //  Add Left Border
    func addLeftBorderWithColor(color: UIColor, width: CGFloat) {
        let border = CALayer();
        border.backgroundColor = color.cgColor;
        border.frame = CGRect(x: 0, y: 0, width: width, height: self.getHeight());
        self.layer.addSublayer(border);
    }
}

public extension UIView {
    
    struct TouchAreaAssociatedKey {
        static let touchAreaInsetsKey = UnsafeRawPointer(bitPattern: "touchAreaInsetsKey".hashValue);
    }
    
    var touchAreaInsets: UIEdgeInsets {
        get {
            let e = objc_getAssociatedObject(self, TouchAreaAssociatedKey.touchAreaInsetsKey!);
            return e as? UIEdgeInsets ?? UIEdgeInsets.zero;
        }
        set {
            objc_setAssociatedObject(self, TouchAreaAssociatedKey.touchAreaInsetsKey!, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
    }
}
