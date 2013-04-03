//
//  deviceAppDelegate.h
//  device
//
//  Created by shisan lang on 11-10-24.
//  Copyright 2011年 BeiJingChaoYangQu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface deviceAppDelegate : NSObject <UIApplicationDelegate, UITabBarControllerDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet UITabBarController *tabBarController;

@end
