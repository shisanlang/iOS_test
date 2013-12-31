//
//  AppDelegate.h
//  tabbar2
//
//  Created by duan on 13-12-19.
//  Copyright (c) 2013年 duan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyTabBarController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate,UITabBarControllerDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) MyTabBarController *tabBarController;

@end
