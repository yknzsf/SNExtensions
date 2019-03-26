//
//  TimerExtension.swift
//  SNExtensions
//
//  Created by shaofeng on 2017/5/26.
//  Copyright © 2017年 zsf. All rights reserved.
//

import UIKit

public extension Timer {

    class func scheduledTimerWithTimeInterval(timeInterval interval: TimeInterval, repeats: Bool, block: @escaping (Timer) -> Swift.Void) -> Timer {
        
        let timer = Timer.scheduledTimer(timeInterval: interval, target: self, selector: #selector(Timer.execBlock(timer:)), userInfo: block, repeats: repeats);
        return timer
    }
    
    class func timerWithTimeInterval(timeInterval interval: TimeInterval, repeats: Bool, block: @escaping (Timer) -> Swift.Void) -> Timer {
        let timer = Timer(timeInterval: interval, target: self, selector: #selector(Timer.execBlock(timer:)), userInfo: block, repeats: repeats);
        return timer;
    }
    
    @objc class func execBlock(timer: Timer) {
        
        if let block = timer.userInfo as? (Timer) -> Swift.Void {
            block(timer);
        }
    }
}
