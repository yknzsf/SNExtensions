//
//  NSDataExtension.swift
//  SNExtensions
//
//  Created by shaofeng on 2017/3/20.
//  Copyright © 2017年 zsf. All rights reserved.
//

import Foundation
import UIKit

public extension Data {
    //  Convert NSData to NSDictionary
    var toNSDictionary : NSDictionary! {
        let JSONData = self
        do {
            let JSON = try JSONSerialization.jsonObject(with: JSONData, options: JSONSerialization.ReadingOptions(rawValue: 0));
            guard let dictioonary :NSDictionary = JSON as? NSDictionary else {
                print("Not a Dictionary")
                return nil
            }
            return dictioonary
        }
        catch let JSONError as NSError {
            print("\(JSONError)")
        }
        return nil
    }
    
    //  Convert NSData to String
    var toJsonNSString : NSString! {
        return NSString(data: self, encoding: String.Encoding.utf8.rawValue);
    }
    
    var toJsonString: String! {
        return String(data: self, encoding: String.Encoding.utf8);
    }
}

extension NSMutableData {
    
    //  Append String data to NSData
    public func appendString(string: String) {
        let data = string.data(using: String.Encoding.utf8, allowLossyConversion: true)
        append(data!)
    }
}
