//
//  arrayAppDelegate.h
//  array
//
//  Created by shisan lang on 11-10-10.
//  Copyright 2011年 BeiJingChaoYangQu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class arrayViewController;

@interface arrayAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet arrayViewController *viewController;

@end
