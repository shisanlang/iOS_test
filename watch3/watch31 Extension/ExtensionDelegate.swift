//
//  ExtensionDelegate.swift
//  watch31 Extension
//
//  Created by 十三郎 on 16/7/7.
//  Copyright © 2016年 QianHai. All rights reserved.
//

import WatchKit

class ExtensionDelegate: NSObject, WKExtensionDelegate {

    func applicationDidFinishLaunching() {
        // Perform any final initialization of your application.
        
    }

    func applicationDidBecomeActive() {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        
        let userdefaults = NSUserDefaults(suiteName: "group.com.neeqm.watch3")
        let stock = userdefaults?.stringForKey("stock")
        
        var filePathURL =  NSFileManager.defaultManager().containerURLForSecurityApplicationGroupIdentifier("group.com.neeqm.watch3")
        filePathURL = filePathURL?.URLByAppendingPathComponent("local_mystock.plist")
        
        var stockArray = NSArray.init(contentsOfURL:filePathURL!)
        
        
        print("\(stock,filePathURL,stockArray)")
    }

    func applicationWillResignActive() {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, etc.
    }

}
