//
//  UIButtonExtraSize.swift
//  SNExtensions
//
//  Created by zsf on 2019/8/28.
//  Copyright © 2019 zsf. All rights reserved.
//

import UIKit

private struct ButtonAssociatedKeys {
    static var extraWidthKey: String = "extraWidthKey";
    static var extraHeightKey: String = "extraHeightKey";
}

extension UIButton {
    
    /*
     * 按钮额外扩展宽度
     */
    public var extraWidth: Float {
        get {
            return objc_getAssociatedObject(self, &ButtonAssociatedKeys.extraWidthKey) as? Float ?? 0.0;
        }
        set {
            objc_setAssociatedObject(self, &ButtonAssociatedKeys.extraWidthKey, newValue, .OBJC_ASSOCIATION_ASSIGN);
        }
    }
    
    /*
    * 按钮额外扩展高度
    */
    public var extraHeight: Float {
        get {
            return objc_getAssociatedObject(self, &ButtonAssociatedKeys.extraHeightKey) as? Float ?? 0.0;
        }
        set {
            objc_setAssociatedObject(self, &ButtonAssociatedKeys.extraHeightKey, newValue, .OBJC_ASSOCIATION_ASSIGN);
        }
    }
    
    /// 高度和宽度相扩大指定数值 正值表示缩小，负值表示扩大。
    ///
    /// - Parameters:
    ///   - point: point
    ///   - event: event
    /// - Returns: UIView

    override open func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        if isHidden {
            return nil
        }
        let bigRect = self.bounds.insetBy(dx: CGFloat(-extraWidth), dy: CGFloat(-extraHeight))
        if (bigRect.contains(point)) {
            return self
        }else {
            return nil
        }
    }
}
