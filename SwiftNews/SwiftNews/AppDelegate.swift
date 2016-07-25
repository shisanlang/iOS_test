//
//  AppDelegate.swift
//  SwiftNews
//
//  Created by 十三郎 on 16/7/25.
//  Copyright © 2016年 QianHai. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        self.window?.backgroundColor = UIColor.whiteColor()
        
        let vc1:UIViewController = FirstViewController()
        let vc2:SecondViewController = SecondViewController()
        
        let nav1 = UINavigationController(rootViewController: vc1)
        nav1.tabBarItem = UITabBarItem(title: "首页", image: UIImage(named: ""), tag: 1)
        let nav2 = UINavigationController(rootViewController: vc2)
        nav2.tabBarItem = UITabBarItem(title: "我的", image: UIImage(named: ""), tag: 2)
        
        let tabVC:UITabBarController = UITabBarController()
        tabVC.viewControllers = [nav1, nav2]
        
        self.window?.makeKeyAndVisible()
        self.window?.rootViewController = tabVC
        
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

