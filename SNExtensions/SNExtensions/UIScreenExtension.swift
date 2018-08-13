//
//  UIScreenExtension.swift
//  SNExtensions
//
//  Created by shaofeng on 2017/5/27.
//  Copyright © 2017年 zsf. All rights reserved.
//

import UIKit

public extension UIScreen {
    
    public class var pixelLength: CGFloat {
        return 1.0 / UIScreen.main.nativeScale;
    }
    
    public var width: CGFloat {
        return UIScreen.main.bounds.size.width;
    }
    
    public var height: CGFloat {
        return UIScreen.main.bounds.size.height;
    }
    
    public var size: CGSize {
        return UIScreen.main.bounds.size;
    }
}
