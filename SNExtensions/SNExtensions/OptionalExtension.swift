//
//  OptionalExtension.swift
//  SNExtensions
//
//  Created by zsf on 2019/8/28.
//  Copyright © 2019 zsf. All rights reserved.
//

import UIKit

public extension Optional where Wrapped == Int {
    
    var value: Int {
        return self ?? 0;
    }
}

public extension Optional where Wrapped == Int8 {
    
    var value: Int8 {
        return self ?? 0;
    }
}

public extension Optional where Wrapped == Int16 {
    
    var value: Int16 {
        return self ?? 0;
    }
}

public extension Optional where Wrapped == Int64 {
    
    var value: Int64 {
        return self ?? 0;
    }
}


public extension Optional where Wrapped == Double {
    
    var value: Double {
        return self ?? 0.0;
    }
}

public extension Optional where Wrapped == Float {
    
    var value: Float {
        return self ?? 0.0;
    }
}

public extension Optional where Wrapped == CGFloat {
    
    var value: CGFloat {
        return self ?? 0.0;
    }
}

public extension Optional where Wrapped == CGPoint {
    
    var value: CGPoint {
        return self ?? CGPoint(x: 0, y: 0);
    }
}

public extension Optional where Wrapped == String {
    
    var value: String {
        return self ?? "";
    }
}

public extension Optional where Wrapped == NSString {
    
    var value: NSString {
        return self ?? "";
    }
}

public extension Optional where Wrapped == NSAttributedString {
    
    var value: NSAttributedString {
        return self ?? NSAttributedString();
    }
}

public extension Optional where Wrapped == NSMutableAttributedString {
    
    var value: NSMutableAttributedString {
        return self ?? NSMutableAttributedString();
    }
}

public extension Optional where Wrapped == Data {
    
    var value: Data {
        return self ?? Data();
    }
}

public extension Optional where Wrapped == Date {
    
    var value: Date {
        return self ?? Date();
    }
}

public extension Optional where Wrapped == NSArray {
    
    var value: NSArray {
        return self ?? NSArray();
    }
}

public extension Optional where Wrapped == NSMutableArray {
    
    var value: NSMutableArray {
        return self ?? NSMutableArray();
    }
}

public extension Optional where Wrapped == NSDictionary {
    
    var value: NSDictionary {
        return self ?? NSDictionary();
    }
}

public extension Optional where Wrapped == NSMutableDictionary {
    
    var value: NSMutableDictionary {
        return self ?? NSMutableDictionary();
    }
}

public extension Optional {
    /// 可选值为空的时候返回 true
    var isNone: Bool {
        switch self {
        case .none:
            return true
        case .some:
            return false
        }
    }
    
    /// 可选值非空返回 true
    var isSome: Bool {
        return !isNone
    }
}
