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

public extension Optional where Wrapped == Int64 {
    
    var value: Int64 {
        return self ?? 0;
    }
}

public extension Optional where Wrapped == String {
    
    var value: String {
        return self ?? "";
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
