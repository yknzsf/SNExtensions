//
//  UIFontExtension.swift
//  SNExtensions
//
//  Created by shaofeng on 2017/3/21.
//  Copyright © 2017年 zsf. All rights reserved.
//

import UIKit

public extension UIFont {
    
    class func systemFont(name:String, fontSize: CGFloat) -> UIFont {
        if let font = UIFont(name: name, size: fontSize) {
            return font;
        }
        let font = UIFont.systemFont(ofSize: fontSize);
        return font;
    }
    
    class func pingFangTCMediumFont(_ fontSize: CGFloat) -> UIFont {
        
        let font = UIFont.systemFont(name: "PingFangTC-Medium", fontSize: fontSize);
        return font;
    }
    
    class func pingFangTCRegularFont(_ fontSize: CGFloat) -> UIFont {
        
        let font = UIFont.systemFont(name: "PingFangTC-Regular", fontSize: fontSize);
        return font;
    }
    
    class func pingFangTCLightFont(_ fontSize: CGFloat) -> UIFont {
        
        let font = UIFont.systemFont(name: "PingFangTC-Light", fontSize: fontSize);
        return font;
    }
    
    class func pingFangTCUltralightFont(_ fontSize: CGFloat) -> UIFont {
        
        let font = UIFont.systemFont(name: "PingFangTC-Ultralight", fontSize: fontSize);
        return font;
    }
    
    class func pingFangTCSemiboldFont(_ fontSize: CGFloat) -> UIFont {
        
        let font = UIFont.systemFont(name: "PingFangTC-Semibold", fontSize: fontSize);
        return font;
    }
    
    class func pingFangTCThinFont(_ fontSize: CGFloat) -> UIFont {
        
        let font = UIFont.systemFont(name: "PingFangTC-Thin", fontSize: fontSize);
        return font;
    }
    
    class func pingFangHKUltralightFont(_ fontSize: CGFloat) -> UIFont {
        
        let font = UIFont.systemFont(name: "PingFangHK-Ultralight", fontSize: fontSize);
        return font;
    }
    
    class func pingFangHKSemiboldFont(_ fontSize: CGFloat) -> UIFont {
        
        let font = UIFont.systemFont(name: "PingFangHK-Semibold", fontSize: fontSize);
        return font;
    }
    
    class func pingFangHKThinFont(_ fontSize: CGFloat) -> UIFont {
        
        let font = UIFont.systemFont(name: "PingFangHK-Thin", fontSize: fontSize);
        return font;
    }
    
    class func pingFangHKLightFont(_ fontSize: CGFloat) -> UIFont {
        
        let font = UIFont.systemFont(name: "PingFangHK-Light", fontSize: fontSize);
        return font;
    }
    
    class func pingFangHKRegularFont(_ fontSize: CGFloat) -> UIFont {
        
        let font = UIFont.systemFont(name: "PingFangHK-Regular", fontSize: fontSize);
        return font;
    }
    
    class func pingFangHKMediumFont(_ fontSize: CGFloat) -> UIFont {
        
        let font = UIFont.systemFont(name: "PingFangHK-Medium", fontSize: fontSize);
        return font;
    }
    
    class func pingFangSCUltralightFont(_ fontSize: CGFloat) -> UIFont {
        
        let font = UIFont.systemFont(name: "PingFangSC-Ultralight", fontSize: fontSize);
        return font;
    }
    
    class func pingFangSCRegularFont(_ fontSize: CGFloat) -> UIFont {
        
        let font = UIFont.systemFont(name: "PingFangSC-Regular", fontSize: fontSize);
        return font;
    }
    
    class func pingFangSCSemiboldFont(_ fontSize: CGFloat) -> UIFont {
        
        let font = UIFont.systemFont(name: "PingFangSC-Semibold", fontSize: fontSize);
        return font;
    }
    
    class func pingFangSCThinFont(_ fontSize: CGFloat) -> UIFont {
        
        let font = UIFont.systemFont(name: "PingFangSC-Thin", fontSize: fontSize);
        return font;
    }
    
    class func pingFangSCLightFont(_ fontSize: CGFloat) -> UIFont {
        
        let font = UIFont.systemFont(name: "PingFangSC-Light", fontSize: fontSize);
        return font;
    }
    
    class func pingFangSCMediumFont(_ fontSize: CGFloat) -> UIFont {
        
        let font = UIFont.systemFont(name: "PingFangSC-Medium", fontSize: fontSize);
        return font;
    }
}

// MARK: 宋体
public extension UIFont {
    
    class func songtiSCBoldFont(_ fontSize: CGFloat) -> UIFont {
        let font = UIFont.systemFont(name: "HYa3gj", fontSize: fontSize);
        return font;
    }
    
    class func songtiSCRegularFont(_ fontSize: CGFloat) -> UIFont {
        let font = UIFont.systemFont(name: "HYa3gj", fontSize: fontSize);
        return font;
    }
}

// MARK: DIN
public extension UIFont {
    
    class func dINAlternateBoldFont(_ fontSize: CGFloat) -> UIFont {
        let font = UIFont.systemFont(name: "DINAlternate-Bold", fontSize: fontSize);
        return font;
    }
    
    class func dINCondensedBoldFont(_ fontSize: CGFloat) -> UIFont {
        let font = UIFont.systemFont(name: "DINCondensed-Bold", fontSize: fontSize);
        return font;
    }
}

// MARK: HelveticaNeue
public extension UIFont {
    
    class func helveticaNeueMediumFont(_ fontSize: CGFloat) -> UIFont {
        let font = UIFont.systemFont(name: "HelveticaNeue-Medium", fontSize: fontSize);
        return font;
    }
}
