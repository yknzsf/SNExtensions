//
//  UIScreenExtension.swift
//  SNExtensions
//
//  Created by shaofeng on 2017/5/27.
//  Copyright © 2017年 zsf. All rights reserved.
//

import UIKit

public extension UIScreen {
        
    var width: CGFloat {
        return UIScreen.main.bounds.size.width;
    }
    
    var height: CGFloat {
        return UIScreen.main.bounds.size.height;
    }
    
    var size: CGSize {
        return UIScreen.main.bounds.size;
    }
}
