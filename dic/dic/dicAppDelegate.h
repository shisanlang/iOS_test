//
//  dicAppDelegate.h
//  dic
//
//  Created by shisan lang on 11-9-13.
//  Copyright 2011年 BeiJingChaoYangQu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class dicViewController;

@interface dicAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet dicViewController *viewController;

@end
