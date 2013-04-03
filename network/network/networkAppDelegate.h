//
//  networkAppDelegate.h
//  network
//
//  Created by shisan lang on 11-10-24.
//  Copyright 2011年 BeiJingChaoYangQu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class networkViewController;

@interface networkAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet networkViewController *viewController;

@end
