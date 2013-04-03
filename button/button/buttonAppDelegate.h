//
//  buttonAppDelegate.h
//  button
//
//  Created by shisan lang on 11-8-4.
//  Copyright 2011年 BeiJingChaoYangQu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class buttonViewController;

@interface buttonAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet buttonViewController *viewController;

@end
