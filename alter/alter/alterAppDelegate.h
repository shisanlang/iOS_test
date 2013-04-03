//
//  alterAppDelegate.h
//  alter
//
//  Created by shisan lang on 11-8-15.
//  Copyright 2011年 BeiJingChaoYangQu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class alterViewController;

@interface alterAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet alterViewController *viewController;

@end
