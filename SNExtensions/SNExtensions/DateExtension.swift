//
//  DateExtension.swift
//  SNExtensions
//
//  Created by shaofeng on 2017/3/17.
//  Copyright © 2017年 zsf. All rights reserved.
//

import Foundation
public extension Date {
    
    //  Get Week day from date
    var weekday:Int {
        return Calendar.current.component(.weekday, from: self);
    }
    
    //  Get Week index of month from date
    var weekOfMonth : Int {
        return Calendar.current.component(.weekOfMonth, from: self);
    }
    
    //  Get Week day name from date
    var weekDayName : String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE"
        return formatter.string(from: self)
    }
    
    
    //  Get Month name from date
    var monthName : String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM"
        return formatter.string(from: self)
    }
    
    //  Get Month index from date
    var month: Int {
        return Calendar.current.component(.month, from: self);
    }
    
    //  Get Day index from date
    var day: Int {
        return Calendar.current.component(.day, from: self);
    }
    
    //  Get Year index from date
    var year: Int {
        return Calendar.current.component(.year, from: self);
    }
    
    //  Get Hour and Minute from date
    func getHourAndMinute() -> (hour : Int, minute : Int) {
        let calendar = Calendar.current;
        let comp = calendar.dateComponents([.hour,.minute], from: self);
        return (comp.hour ?? 0, comp.minute ?? 0);
    }
    
    //  Get Total count of weeks in month from date
//    public func weeksInMonth() -> Int?
//    {
//        let calendar = Calendar(identifier: .gregorian);
//
//        calendar.firstWeekday = 2 // 2 == Monday
//        
//        // First monday in month:
//        let comps = NSDateComponents()
//        comps.month = self.month
//        comps.year = self.year
//        comps.weekday = calendar.firstWeekday
//        comps.weekdayOrdinal = 1
//        guard let first = calendar.dateFromComponents(comps)  else {
//            return nil
//        }
//        
//        // Last monday in month:
//        comps.weekdayOrdinal = -1
//        guard let last = calendar.dateFromComponents(comps)  else {
//            return nil
//        }
//        
//        // Difference in weeks:
//        let weeks = calendar.components(.WeekOfMonth, fromDate: first, toDate: last, options: [])
//        return weeks.weekOfMonth + 1
//    }
//    
//    //  Get Total count of week days in month from date
//    public func weekDaysInMonth() -> Int?
//    {
//        guard 1...12 ~= month else { return nil }
//        
//        let calendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)!
//        let components = NSDateComponents()
//        components.weekday =  self.weekDay
//        components.weekdayOrdinal = 1
//        components.month = self.month
//        components.year = self.year
//        
//        if let date = calendar.dateFromComponents(components)  {
//            let firstDay = calendar.component(.Day, fromDate: date)
//            let days = calendar.rangeOfUnit(.Day, inUnit:.Month, forDate:date).length
//            return (days - firstDay) / 7 + 1
//        }
//        return nil
//    }
    
    //  Get Total count of days in month from date
    func daysInMonth() -> Int? {
        let calendar = Calendar(identifier: .gregorian);
        return calendar.range(of: .day, in: .month, for: self)?.count;
    }
    
    //  Get Time in AM / PM format
    func getTime() -> String {
        let formatter = DateFormatter();
        formatter.dateFormat = "hh:mm a";
        return formatter.string(from: self);
    }
    
    //  Get Time short (i.e 12 Mar) format
    func getTimeInShortFormat() -> String{
        let formatter = DateFormatter();
        formatter.dateFormat = "dd MMM";
        return formatter.string(from: self);
    }
    
    //  Get Time short (i.e 12 Mar, 2016) format
    func getTimeInFullFormat() -> String{
        let formatter = DateFormatter();
        formatter.dateFormat = "dd MMM, yyyy";
        return formatter.string(from: self);
    }
    
    //  Get Time standard (i.e 2016-03-12) format
    func formateBirthDate() -> String {
        let formatter = DateFormatter();
        formatter.dateFormat = "yyyy-MM-dd";
        return formatter.string(from: self);
    }
    
    //  Check date is after date
    func afterDate(date : Date) -> Bool {
        return self.compare(date) == ComparisonResult.orderedAscending;
    }
    
    //  Check date is before date
    func beforDate(date : Date) -> Bool {
        return self.compare(date) == ComparisonResult.orderedDescending
    }
    
    //  Check date is equal date
    func equalDate(date : Date) -> Bool {
        return self.compare(date) == ComparisonResult.orderedSame;
    }
    
    //  Get days difference between dates
    func daysInBetweenDate(date: Date) -> Int {
        var difference = self.timeIntervalSinceNow - date.timeIntervalSinceNow
        difference = fabs(difference/86400)
        return Int(difference)
    }
    
    //  Get hours difference between dates
    func hoursInBetweenDate(date: Date) -> Int {
        var difference = self.timeIntervalSinceNow - date.timeIntervalSinceNow
        difference = fabs(difference/3600)
        return Int(difference)
    }
    
    //  Get minutes difference between dates
    func minutesInBetweenDate(date: Date) -> Int {
        var difference = self.timeIntervalSinceNow - date.timeIntervalSinceNow
        difference = fabs(difference/60)
        return Int(difference)
    }
    
    //  Get seconds difference between dates
    func secondsInBetweenDate(date: Date) -> Int {
        var difference = self.timeIntervalSinceNow - date.timeIntervalSinceNow
        difference = fabs(difference)
        return Int(difference)
    }
    
    //  Get time difference between dates
    func getDifferenceBetweenDates() -> String {
        let interval = self.timeIntervalSinceNow
        let year : Int = Int(interval) / 31536000
        var finalString = "'"
        if year >= 1 {
            if year == 1 {
                finalString += "1 year : "
            }
            else {
                finalString += "\(year) years : "
            }
        }
        let remainAfterYear = Int( interval) % 31536000
        let month = remainAfterYear / 2592000
        if month >= 1 {
            if month == 1 {
                finalString += "1 month : "
            }
            else {
                finalString += "\(month) months : "
            }
        }
        let remainAfterMonth =  remainAfterYear % 2592000
        let day = remainAfterMonth / 86400
        if day >= 1 {
            if day == 1 {
                finalString += "1 day : "
            }
            else {
                finalString += "\(day) days : "
            }
        }
        let remainAfterDay =  remainAfterMonth % 86400
        let hour = remainAfterDay / 3600
        if hour >= 1 {
            finalString += "\(hour)h : "
        }
        let remainAfterHour = remainAfterDay % 3600
        let minute = remainAfterHour / 60
        if minute >= 1 {
            finalString += "\(minute)m : "
        }
        let remainAfterMinute = remainAfterHour % 60
        let second = remainAfterMinute / 60
        if second >= 1 {
            finalString += "\(second)s "
        }
        
        return finalString
    }
}
