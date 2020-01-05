//
//  IntExtension.swift
//  SNExtensions
//
//  Created by shaofeng on 2017/3/17.
//  Copyright © 2017年 zsf. All rights reserved.
//

import UIKit

public extension Int {
    
    //  Check is even
    var isEven: Bool {
        return self % 2 == 0
    }
    
    //  Check is odd
    var isOdd: Bool {
        return !self.isEven
    }
    
    //  Check is Positive
    var isPositive: Bool {
        return self >= 0
    }
    
    //  Check is Negative
    var isNegative: Bool {
        return !self.isPositive
    }
    
    //  Get Digit
    func digit() -> [Int] {
        return description.map{Int(String($0)) ?? 0}
    }
    
    //  Get Digit count
    var digitCount: Int {
        return self.digit().count
    }
    
    //  Convert to Float
    var toFloat: Float {
        return Float(self)
    }
    
    //  Convert to CGFloat
    var toCGFloat: CGFloat {
        return CGFloat(self)
    }
    
    //  Convert to String
    var toString: String {
        return String(self)
    }
    
    //  Convert to Int64
    var toInt64: Int64 {
        return Int64(self)
    }
    
    //  Convert to Double
    var toDouble : Double {
        return Double(self)
    }
    
    //  Convert to UInt
    var toUInt : UInt {
        return UInt(self)
    }
    
    //   Return Factorial
    func factorial() -> Int {
        return self == 0 ? 1 : self * (self - 1).factorial()
    }
    
    var pixel: CGFloat {
        
        return CGFloat(self) / UIScreen.main.nativeScale;
    }
}

public extension UInt {
    //  Convert UInt to Int
    var toInt: Int {
        return Int(self)
    }
}
