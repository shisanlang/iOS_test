//
//  AppDelegate.m
//  onlycode
//
//  Created by duan on 12-4-13.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

@synthesize window = _window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    UIViewController * rootView = [[UIViewController alloc]init];
    rootView.view.frame = CGRectMake(0, 0, 320, 640);
    UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(20, 20, 200, 40)];
    label.font = [UIFont fontWithName:@"宋体" size:20];
    label.text = @"纯代码空项目";
    [rootView.view addSubview:label];

    UIButton * but= [UIButton buttonWithType:UIButtonTypeRoundedRect];
    but.frame = CGRectMake(20, 80, 100, 30);
    but.tag = 0;
    [but setTitle:@"启动大智慧" forState:UIControlStateNormal];
    [but addTarget:self action:@selector(startDzh:) forControlEvents:UIControlEventTouchUpInside];
    [rootView.view addSubview:but];
    
    UIButton * hello_but= [UIButton buttonWithType:UIButtonTypeRoundedRect];
    hello_but.frame = CGRectMake(20, 120, 100, 30);
    hello_but.tag = 1;
    [hello_but setTitle:@"启动 Hello" forState:UIControlStateNormal];
    [hello_but addTarget:self action:@selector(startDzh:) forControlEvents:UIControlEventTouchUpInside];
    [rootView.view addSubview:hello_but];
    
    
    //判断 目标 是否为模拟器
    #if TARGET_IPHONE_SIMULATOR
        {
            // Simulator
        }
    #else
        {
            // Device
        }
    #endif
    
    //字符串
    NSString * str = @"2012/9/11 0:00:00";    
    NSError *error;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:
                                  @"(\\d+)/(\\d+)/(\\d+)" options:NSRegularExpressionCaseInsensitive error:&error];
    NSArray *array =    nil;
    array = [regex matchesInString:str options:NSMatchingReportCompletion range:NSMakeRange(0, [str length])];
    
    NSString *str1 = nil;
    for (NSTextCheckingResult* b in array)
    {
        str1 = [str substringWithRange:b.range];
        NSLog(@"str 1 is %@",str1);
        NSInteger count = [b numberOfRanges];
        for(NSInteger index = 0;index<count;index++){ 
            NSRange halfRange = [b rangeAtIndex:index]; 
            NSLog(@"n------>子匹配内容：%@",[str substringWithRange:halfRange]);
        } 
        NSLog(@"#");
    }

    
    self.window.rootViewController = rootView;
    
    return YES;
}

- (void) startDzh:(UIButton *)but
{
    NSURL *appStoreUrl;
    if (but.tag == 0) {

        appStoreUrl = [NSURL URLWithString:@"http://itunes.apple.com/cn/app/da-zhi-hui-chao-ying-zhuan/id368917753?mt=8"];
        
    } else if (but.tag == 1) {
        appStoreUrl = [NSURL URLWithString:@"myapplication:"];
    }
    
    [[UIApplication sharedApplication] openURL:appStoreUrl];
    
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
