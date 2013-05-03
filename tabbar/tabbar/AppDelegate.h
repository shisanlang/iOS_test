//
//  AppDelegate.h
//  tabbar
//
//  Created by duan on 13-5-3.
//  Copyright (c) 2013年 duan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyTabBarController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate, UITabBarControllerDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) MyTabBarController *tabBarController;

@end
