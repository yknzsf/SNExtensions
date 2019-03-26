//
//  NSObjectExtension.swift
//  SNExtensions
//
//  Created by shaofeng on 2017/5/25.
//  Copyright © 2017年 zsf. All rights reserved.
//

import UIKit

public extension NSObject {
    
    class var className: String {
        let str = classAllName;
        let strArray = str.components(separatedBy: ".");
        if strArray.count >= 2 {
            return strArray[1];
        }
        return str;
    }
    
    class var projectName: String {
        let str = classAllName;
        let strArray = str.components(separatedBy: ".");
        if strArray.count >= 1 {
            return strArray[0];
        }
        return str;
    }

    class var classAllName: String {
        let str = NSStringFromClass(self);
        return str;
    }
    
    @discardableResult
    class func swizzleMethodSelector(origSelector: String, withSelector: String, forClass:AnyClass) -> Bool {
        
        var originalMethod: Method?
        var swizzledMethod: Method?
        
        originalMethod = class_getInstanceMethod(forClass, Selector(origSelector))
        swizzledMethod = class_getInstanceMethod(forClass, Selector(withSelector))
        
        if let oMethod = originalMethod,let sMethod = swizzledMethod {
            method_exchangeImplementations(oMethod, sMethod)
            return true
        }
        
        return false
    }
    
    @discardableResult
    class func swizzleStaticMethodSelector(origSelector: String, withSelector: String, forClass:AnyClass) -> Bool {
        
        var originalMethod: Method?
        var swizzledMethod: Method?
        
        originalMethod = class_getClassMethod(forClass, Selector(origSelector))
        swizzledMethod = class_getClassMethod(forClass, Selector(withSelector))
        
        if let oMethod = originalMethod,let sMethod = swizzledMethod {
            method_exchangeImplementations(oMethod, sMethod)
            return true
        }

        return false
    }

}
