//
//  StringExtension.swift
//  SNExtensions
//
//  Created by shaofeng on 2017/3/17.
//  Copyright © 2017年 zsf. All rights reserved.
//

import UIKit

public extension String {
    
    //  Trim String with white spaces
    func trim() -> String {
         return replacingOccurrences(of: " ", with: "");
    }
    
    //  Trim String with new line character
    func trimForNewLineCharacterSet() -> String {
        return trimmingCharacters(in: NSCharacterSet.newlines);
    }
    
    //  Trim String for phone number string
    func trimPhoneNumberString() -> String {
        return replacingOccurrences(of: "\\D", with: "", options: .regularExpression, range: self.startIndex..<self.endIndex);
    }
    
    // String length
    var length: Int {
        return self.count
    }
    
    //  Date from String
    func getDate() -> Date {
        let dateFormate = DateFormatter()
        dateFormate.dateFormat = "yyyy-MM-dd"
        return dateFormate.date(from: self)!
    }
    
    //  Date with time from String
    func getDateAndTime() -> Date {
        let dateFormate = DateFormatter()
        dateFormate.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return dateFormate.date(from: self)!;
    }
    
    //  Make array from string with comma (,)
    var makeArray : Array<Any> {
        return components(separatedBy: ",");
    }
    
    //  Make array from string with white space ( )
    var makeArrayByWhiteSpace : Array<Any> {
        return components(separatedBy: " ");
    }
    
    //  Get nth character
    subscript(integerIndex: Int) -> Character {
        let index = self.index(startIndex, offsetBy: integerIndex);
        return self[index]
    }
    
    //  Get sub string with range
    subscript(integerRange: Range<Int>) -> String {
        let start = self.index(startIndex, offsetBy: integerRange.lowerBound);
        let end = self.index(startIndex, offsetBy: integerRange.upperBound);

        let range = start..<end;
        return String(self[range]);
    }
    
    //  Convert String to Dictionary
    var toDictionary : [String: Any]? {
        let data = self.data(using: String.Encoding.utf8);
        do {
            return try JSONSerialization.jsonObject(with: data!) as? [String: Any];
        } catch {
            // failure
            print("Fetch failed: \((error as NSError).localizedDescription)")
        }
        return nil
    }

    
//    /***
//     Get String size
//     :param: font
//     :param: width
//     :param: lineSpecing
//     :returns: Size of this string using these parameters
//     */
//    func stringSizeWith(font: UIFont,width:Float, lineSpecing : Float)->CGRect
//    {
//        let size = CGSizeMake(width,CGFloat.max)
//        let paragraphStyle = NSMutableParagraphStyle()
//        if lineSpecing > 0 {
//            paragraphStyle.lineSpacing = lineSpecing
//        }
//        paragraphStyle.lineBreakMode = .ByWordWrapping;
//        let  attributes = [NSFontAttributeName:font,
//                           NSParagraphStyleAttributeName:paragraphStyle.copy()]
//        
//        let text = self as NSString
//        let rect = text.boundingRectWithSize(size, options: .UsesLineFragmentOrigin, attributes: attributes, context:nil)
//        return rect
//    }
//    
//    /**
//     Get String Width
//     :param: font
//     :returns: Width of this string using given font
//     */
//    func stringWidth(font: UIFont) -> CGFloat {
//        let  attributes = [NSFontAttributeName:font]
//        let text = self as NSString
//        let size = text.sizeWithAttributes(attributes)
//        return size.width
//    }
//    
//    /**
//     Remove character
//     :param: count
//     :returns: String with removed characters
//     */
//    func removeCharsFromEnd(count_:Int) -> String {
//        let stringLength = self.characters.count
//        let substringIndex = (stringLength < count_) ? 0 : stringLength - count_
//        return self.substringToIndex(self.startIndex.advancedBy(substringIndex))
//    }
//    
//    //  Matches Regex in String
//    func matchesForRegexInText(regex: String!) -> [String] {
//        
//        do {
//            let regex = try NSRegularExpression(pattern: regex, options: [])
//            let nsString = self as NSString
//            let results = regex.matchesInString(self,
//                                                options: [], range: NSMakeRange(0, nsString.length))
//            return results.map { nsString.substringWithRange($0.range)}
//        } catch let error as NSError {
//            print("invalid regex: \(error.localizedDescription)")
//            return []
//        }
//    }
//    
//    //  Get Youtube video Id from String
//    func getYoutubeID() -> String {
//        let pattern: String = "(?<=v(=|/))([-a-zA-Z0-9_]+)|(?<=youtu.be/)([-a-zA-Z0-9_]+)"
//        do {
//            let regex = try NSRegularExpression(pattern: pattern, options: .CaseInsensitive)
//            if let regexMatch = regex.firstMatchInString(self, options: NSMatchingOptions.ReportProgress, range: NSRange(location: 0, length: self.utf16.count)) {
//                return (self as NSString).substringWithRange(regexMatch.range)
//            }
//        } catch {
//            // failure
//            return ""
//        }
//        return ""
//    }
    var urldecode: String? {
        return self.removingPercentEncoding;
    }
    
    var urlencode: String? {
        return self.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed);
    }
    //  Convert String to Double Value
    func toDouble() -> Double? {
        if let myNumber = NumberFormatter().number(from: self) {
            return myNumber.doubleValue
        } else {
            return nil
        }
    }
    
    //  Convert String to Float Value
    func toFloat() -> Float? {
        if let myNumber = NumberFormatter().number(from: self) {
            return myNumber.floatValue
        } else {
            return nil
        }
    }
    
    //   Convert String to UInt Value
    func toUInt() -> UInt? {
        if let myNumber = NumberFormatter().number(from: self) {
            return myNumber.uintValue
        } else {
            return nil
        }
    }
    
    //  Convert String to Bool Value
    func toBool() -> Bool? {
        if let myNumber = NumberFormatter().number(from: self) {
            return myNumber.boolValue
        } else {
            return nil
        }
    }
    
    //  Check for email validation
    var isEmail: Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
    
    //  Check for URL validation
    var isValideUrl : Bool {
        let urlRegEx = "((?:http|https)://)?(?:www\\.)?[\\w\\d\\-_]+\\.\\w{2,3}(\\.\\w{2})?(/(?<=/)(?:[\\w\\d\\-./_]+)?)?"
        let predicate = NSPredicate(format:"SELF MATCHES %@", argumentArray:[urlRegEx])
        return predicate.evaluate(with: self)
    }
    
    //  Convert to NSData
    func toNSData() -> NSData? {
        if let data = self.data(using: String.Encoding.utf8, allowLossyConversion: true) {
            return NSData(data: data);
        }
        return nil;
    }
    
    //  Check for Substring with ignoring case sensitive
    func containsIgnoreCase(_ other: String) -> Bool{
        
        let selfString = self.lowercased();
        let otherString = other.lowercased();
        return selfString.contains(otherString);
    }
    
    //  Get last path component
    var lastPathComponent: String {
        get {
            return (self as NSString).lastPathComponent;
        }
    }
    
    //  Get path Extenction
    var pathExtension: String {
        get {
            return (self as NSString).pathExtension;
        }
    }
    
    //  Delete last path component
    var deletingLastPathComponent: String {
        get {
            return (self as NSString).deletingLastPathComponent;
        }
    }
    
    //  Delete path extension
    var deletingPathExtension: String {
        get {
            return (self as NSString).deletingPathExtension;
        }
    }
    
    //  Get all path component
    var pathComponents: [String] {
        get {
            return (self as NSString).pathComponents;
        }
    }
    
    //  Add path component
    func appendingPathComponent(path: String) -> String {
        let mainString = self as NSString
        return mainString.appendingPathComponent(path);
    }
    
    //  Add path extension
    func appendingPathExtension(ext: String) -> String? {
        let mainString = self as NSString
        return mainString.appendingPathExtension(ext);
    }
    
    /**
     Inserts a substring at the given index in self.
     :param: index Where the new string is inserted
     :param: string String to insert
     :returns: String formed from self inserting string at index
     */
    func insertSubString (index: Int, _ string: String) -> String {
        if index > length {
            return self + string
        } else if index < 0 {
            return string + self
        }
        
        return self[0..<index] + string + self[index..<length]
    }
    
    var md5: String {
        return SNMD5.encodeMD5(digest: md5Digest)
    }
    
    var md5Digest: [Byte] {
        let bytes = [Byte](self.utf8)
        let digest = SNMD5.md5(bytes)
        return digest.digest
    }
}

//extension NSAttributedString {
//    //  Get string width
//    func stringSizeWith(width:CGFloat)->CGRect
//    {
//        let size = CGSizeMake(width,CGFloat.max)
//        let options : NSStringDrawingOptions = [.UsesLineFragmentOrigin , .UsesFontLeading ]
//        let text = self as NSAttributedString
//        let rect = text.boundingRectWithSize(size, options: options , context:nil)
//        return rect
//    }
//}
