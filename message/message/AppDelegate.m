//
//  AppDelegate.m
//  message
//
//  Created by duan on 12-3-31.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"

#import "FirstViewController.h"

#import "SecondViewController.h"

@implementation AppDelegate

@synthesize window = _window;
@synthesize tabBarController = _tabBarController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    //noti
     application.applicationIconBadgeNumber = 0;
    
    [[UIApplication sharedApplication] registerForRemoteNotificationTypes:  
     (UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeSound | UIRemoteNotificationTypeAlert)]; 
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    UIViewController *viewController1, *viewController2;
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        viewController1 = [[FirstViewController alloc] initWithNibName:@"FirstViewController_iPhone" bundle:nil];
        viewController2 = [[SecondViewController alloc] initWithNibName:@"SecondViewController_iPhone" bundle:nil];
    } else {
        viewController1 = [[FirstViewController alloc] initWithNibName:@"FirstViewController_iPad" bundle:nil];
        viewController2 = [[SecondViewController alloc] initWithNibName:@"SecondViewController_iPad" bundle:nil];
    }
    self.tabBarController = [[UITabBarController alloc] init];
    self.tabBarController.viewControllers = [NSArray arrayWithObjects:viewController1, viewController2, nil];
    self.window.rootViewController = self.tabBarController;
    [self.window makeKeyAndVisible];

    //判断推送
    UIRemoteNotificationType enabledTypes = [[UIApplication sharedApplication] enabledRemoteNotificationTypes];
    NSLog(@"Noti type = %d",enabledTypes);
    return YES;
}


- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification
{
    NSLog(@"接收到信息");
    
    //    MessageBox *messageBox = [MessageBox sharedInstance];
    //    [messageBox showMessageBoxWithTitle:@"本地提醒"
    //                                message:notif.alertBody
    //                               delegate:self
    //                      cancelButtonTitle:@"OK"
    //                             msgBoxType:E_TYPE_OK];
    
    //    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"推送通知"
    //                                                    message:@"10"
    //                                                   delegate:self
    //                                          cancelButtonTitle:@" 关闭"
    //                                          otherButtonTitles:@" 更新状态10",nil];
    //    [alert show];
    
    //    NSLog(@" 收到推送消息 ： %@",[[userInfo objectForKey:@"aps"] objectForKey:@"alert"]);
    //    if ([[userInfo objectForKey:@"aps"] objectForKey:@"alert"]!=NULL) {
    //        NSString* strmessage = [[userInfo objectForKey:@"aps"] objectForKey:@"alert"];
    //        NSRange range = [strmessage rangeOfString:@":"];
    //        int location = range.location;
    //        NSString* struserid = [strmessage substringToIndex:location];
    //
    //        [[NSUserDefaults standardUserDefaults] setObject:struserid forKey:@"tokenuserid"];
    //    }
    //    NSLog(@" 收到推送消息 ： %@",[[userInfo objectForKey:@"aps"] objectForKey:@"alert"]);
    //    if ([[userInfo objectForKey:@"aps"] objectForKey:@"alert"]!=NULL) {
    //        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"推送通知"
    //                                                        message:[[userInfo objectForKey:@"aps"] objectForKey:@"alert"]
    //                                                       delegate:self
    //                                              cancelButtonTitle:@" 关闭"
    //                                              otherButtonTitles:@" 更新状态1",nil];
    //        [alert show];   
    //    }   
    
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo   
{   
    
    NSLog(@" 收到推送消息 ： %@",[[userInfo objectForKey:@"aps"] objectForKey:@"alert"]);   
    if ([[userInfo objectForKey:@"aps"] objectForKey:@"alert"]!=NULL) {   
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"推送通知"   
                                                        message:[[userInfo objectForKey:@"aps"] objectForKey:@"alert"]   
                                                       delegate:self   
                                              cancelButtonTitle:@" 关闭"   
                                              otherButtonTitles:@" 更新状态",nil];   
        [alert show];   
    }   
}  

- (void)application:(UIApplication*)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData*)deviceToken  
{  
   
    
    NSString * CurDeviceToken = [[[[deviceToken description]
                                    stringByReplacingOccurrencesOfString: @"<" withString: @""]
                                   stringByReplacingOccurrencesOfString: @">" withString: @""]
                                  stringByReplacingOccurrencesOfString: @" " withString: @""];
    
     NSLog(@"My token is: %@\n%@", deviceToken,CurDeviceToken);

}

- (void)application:(UIApplication*)application didFailToRegisterForRemoteNotificationsWithError:(NSError*)error  
{  
    NSLog(@"Failed to get token, error: %@", error);  
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

/*
// Optional UITabBarControllerDelegate method.
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
}
*/

/*
// Optional UITabBarControllerDelegate method.
- (void)tabBarController:(UITabBarController *)tabBarController didEndCustomizingViewControllers:(NSArray *)viewControllers changed:(BOOL)changed
{
}
*/

@end
