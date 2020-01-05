//
//  NotificationCenterExtension.swift
//  SNExtensions
//
//  Created by shaofeng on 2017/5/25.
//  Copyright © 2017年 zsf. All rights reserved.
//

import UIKit

public extension NotificationCenter {
    
    func postOnMainThread(_ notification: Notification) {
        postOnMainThread(notification, waitUntilDone: false);
    }
    
    func postOnMainThread(_ notification: Notification, waitUntilDone: Bool = false) {
        if pthread_main_np() > 0 {
            post(notification);
            return;
        }
        else {
            performSelector(onMainThread: #selector(NotificationCenter.postNotification), with: notification, waitUntilDone: waitUntilDone);
        }
    }

    func postOnMainThread(name aName: NSNotification.Name, object anObject: Any?) {
        post(name: aName, object: anObject, userInfo: nil);
    }
    
    func postOnMainThread(name aName: NSNotification.Name, object anObject: Any?, userInfo aUserInfo: [AnyHashable : Any]? = nil) {
        postOnMainThread(name: aName, object: anObject, userInfo: aUserInfo, waitUntilDone: false);
    }
    
    func postOnMainThread(name aName: NSNotification.Name, object anObject: Any?, userInfo aUserInfo: [AnyHashable : Any]? = nil, waitUntilDone: Bool = false) {
        if pthread_main_np() > 0 {
            post(name: aName, object: anObject, userInfo: aUserInfo);
            return;
        }
        else {
            var dic = Dictionary<String, Any>();
            dic["name"] = aName;
            dic["object"] = anObject;
            dic["userInfo"] = aUserInfo;
            performSelector(onMainThread: #selector(NotificationCenter.postNotificationName), with: dic, waitUntilDone: waitUntilDone);
        }
    }

    @objc func postNotification(notification: Notification) {
        post(notification);
    }
    
    @objc func postNotificationName(info: [String: Any]) {
        
        let object = info["object"];
        let userInfo = info["userInfo"] as? [AnyHashable : Any];
        if let name = info["name"] as? Notification.Name {
            post(name: name, object: object, userInfo: userInfo);
        }
        
    }
}
