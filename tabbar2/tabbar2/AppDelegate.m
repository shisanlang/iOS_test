//
//  AppDelegate.m
//  tabbar2
//
//  Created by duan on 13-12-19.
//  Copyright (c) 2013年 duan. All rights reserved.
//

#import "AppDelegate.h"

#import "FirstViewController.h"
#import "SecondViewController.h"
//#import "FavViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    
    // Override point for customization after application launch.
    UIViewController *viewController1 = [[[FirstViewController alloc] initWithNibName:nil bundle:nil] autorelease];
    UIViewController *viewController2 = [[[SecondViewController alloc] initWithNibName:nil bundle:nil] autorelease];
    UIViewController *vc3 = [[UIViewController alloc] init];
    
    UIViewController *vc4 = [[UIViewController alloc] init];
    
    UIViewController *vc5 = [[UIViewController alloc] init];
    
    UIViewController *vc6 = [[UIViewController alloc] init];
    
    UINavigationController *nav1 = [[UINavigationController alloc]initWithRootViewController:viewController1];
    UINavigationController *nav2 = [[UINavigationController alloc]initWithRootViewController:viewController2];
//    UINavigationController *nav3 = [[UINavigationController alloc]initWithRootViewController:viewController3];
    //    nav3.navigationBar.tintColor = [UIColor redColor];
//    UINavigationController *nav4 = [[UINavigationController alloc]initWithRootViewController:viewController1];
    
    self.tabBarController = [[[MyTabBarController alloc] init] autorelease];
    self.tabBarController.viewControllers = @[nav1, nav2,vc3,vc4,vc5,vc6];//nav3, nav4
    self.window.rootViewController = self.tabBarController;
    self.tabBarController.moreNavigationController.navigationBarHidden = YES;
    
    [nav1 release];
    [nav2 release];
//    [nav3 release];
//    [nav4 release];
    
    [self.window makeKeyAndVisible];
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end