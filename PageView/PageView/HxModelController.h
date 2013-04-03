//
//  HxModelController.h
//  PageView
//
//  Created by lang shisan on 11-11-7.
//  Copyright (c) 2011年 BeiJingChaoYangQu. All rights reserved.
//

#import <Foundation/Foundation.h>

@class HxDataViewController;

@interface HxModelController : NSObject <UIPageViewControllerDataSource>
- (HxDataViewController *)viewControllerAtIndex:(NSUInteger)index storyboard:(UIStoryboard *)storyboard;
- (NSUInteger)indexOfViewController:(HxDataViewController *)viewController;
@end
